#include <cmath>
#include <exception>
#include <format>
#include <iostream>
#include <math.h>
#include <raylib.h>
#include <vector>

using namespace std;

typedef struct Block {
    int strength;
} Block;

typedef struct Grid {
    Rectangle rect;
    int rows, cols;
    Block** blocks;
    Vector2 block_size;
} Grid;

void InitGrid(Grid* grid, Vector2 size, int rows, int cols) {
    grid->rect = Rectangle{0, 0, size.x, size.y};
    grid->rows = rows;
    grid->cols = cols;
    grid->block_size.x = grid->rect.width / cols;
    grid->block_size.y = grid->rect.height / rows;
    grid->blocks = (Block**)malloc(rows * sizeof(Block*));
    for (int r = 0; r < rows; r++) {
        grid->blocks[r] = (Block*)malloc(cols * sizeof(Block));
        for (int c = 0; c < cols; c++) {
            grid->blocks[r][c] = Block{0};
        }
    }
}

int RandomInt(int min, int max) { return rand() % (max - min + 1) + min; }

void ProgressGrid(Grid* grid) {
void ProgressGrid(Grid* grid, int level) {
    for (int r = grid->rows - 1; r >= 0; r--) {
        for (int c = 0; c < grid->cols; c++) {
            if (grid->blocks[r][c].strength > 0) {
                if (r + 1 > grid->rows) {
                    throw new exception();
                }
                grid->blocks[r + 1][c] = Block{grid->blocks[r][c].strength};
                grid->blocks[r][c] = Block{0};
            };
        }
    }

    // add new blocks on the top row
    for (int c = 0; c < grid->cols; c++) {
        if (RandomInt(0, 100) < 10) {
            int level_range_start = (level + 1) * 4;
            int strength = RandomInt(level_range_start, level_range_start + level_range_start / 2);
            grid->blocks[0][c] = Block{strength};
        }
    }
}

#define BLOCK_FONT_SIZE 14

Rectangle BlockRect(Grid* grid, int r, int c) {
    float start_x = c * grid->block_size.x;
    float start_y = r * grid->block_size.y;
    return Rectangle{start_x, start_y, grid->block_size.x, grid->block_size.y};
}

void DrawGrid(Grid* grid) {
    for (int r = 0; r < grid->rows; r++) {
        for (int c = 0; c < grid->cols; c++) {
            if (grid->blocks[r][c].strength == 0)
                continue;

            Rectangle block = BlockRect(grid, r, c);
            DrawRectangleV({block.x, block.y}, {block.width, block.height}, WHITE);
            const char* text = format("{}", grid->blocks[r][c].strength).c_str();
            DrawText(text, block.x + block.width / 2.f - MeasureText(text, BLOCK_FONT_SIZE) / 2.f,
                     block.y + block.height / 2 - BLOCK_FONT_SIZE / 2.f, BLOCK_FONT_SIZE, BLACK);
        }
    }
};

#define BALL_SIZE 10.f
#define BALL_SPEED 10.f

typedef struct Ball {
    Vector2 position;
    bool active;
    Vector2 delta;
} Ball;

#define AIM_LINE_LENGTH 120

void NewBall(vector<Ball>* balls, float x, float y) {
    Ball ball = Ball{{x, y}, false, {1, 1}};
    balls->push_back(ball);
}

enum Bound { TOP, LEFT, BOTTOM, RIGHT };

float GetBallBound(Ball* ball, Bound bound) {
    switch (bound) {
    case TOP:
        return ball->position.y - BALL_SIZE;
    case LEFT:
        return ball->position.x - BALL_SIZE;
    case BOTTOM:
        return ball->position.y + BALL_SIZE;
    case RIGHT:
        return ball->position.x + BALL_SIZE;
    }
}

void SetBallBound(Ball* ball, Bound bound, float pos) {
    switch (bound) {
    case TOP:
        ball->position.y = pos + BALL_SIZE;
        break;
    case LEFT:
        ball->position.x = pos + BALL_SIZE;
        break;
    case BOTTOM:
        ball->position.y = pos - BALL_SIZE;
        break;
    case RIGHT:
        ball->position.x = pos - BALL_SIZE;
        break;
    }
}

enum Collision { NONE, CollisionTop, CollisionBottom, CollisionLeft, CollisionRight };

// only use when a collision is detected;
Collision CircleRectCollision(Vector2 center, int radius, Rectangle& rect) {
    if (center.y <= rect.y && center.y + radius <= rect.y + rect.height) {
        return CollisionTop;
    }

    if (center.y >= rect.y + rect.height && center.y - radius >= rect.y) {
        return CollisionBottom;
    }

    if (center.x <= rect.x && center.x + radius <= rect.x + rect.width) {
        return CollisionLeft;
    }

    if (center.x >= rect.x + rect.width && center.x - radius >= rect.x) {
        return CollisionRight;
    }

    return Collision::NONE; // No collision
}

int main(void) {
    InitWindow(400, 680, "Block Breaker");

    SetTargetFPS(60);

    int base_line_y = GetScreenHeight() - (GetScreenHeight() / 10);
    int sw = GetScreenWidth();
    int start_x = sw / 2;
    int start_y = base_line_y - BALL_SIZE;

    // balls direction in rad
    float direction = M_PI_2;

    Grid grid = {};
    InitGrid(&grid, {(float)sw, (float)base_line_y}, 25, 15);

    grid.blocks[12][8] = Block{5};
    grid.blocks[10][4] = Block{5};
    grid.blocks[5][10] = Block{5};

    vector<Ball> balls;
    NewBall(&balls, start_x, start_y);

    bool is_fired = false;
    bool is_aiming = false;

    int shot_count = 0;
    bool start_set = false;

    int ball_offset = 0;

    while (!WindowShouldClose()) {
        if (is_fired) {
            bool all_done = true;
            for (int i = 0; i < balls.size(); i++) {
                Ball ball = balls[i];
                if (!ball.active)
                    continue;
                all_done = false;
                ball_offset++;

                if (ball_offset < i * 5)
                    continue;

                ball.position.x -= ball.delta.x * BALL_SPEED * cos(direction);
                ball.position.y -= ball.delta.y * BALL_SPEED * sin(direction);

                if (GetBallBound(&ball, LEFT) < 0 || GetBallBound(&ball, RIGHT) > sw) {
                    if (GetBallBound(&ball, LEFT) < 0) {
                        SetBallBound(&ball, LEFT, 0);
                    } else if (GetBallBound(&ball, RIGHT) > sw) {
                        SetBallBound(&ball, RIGHT, sw);
                    }
                    ball.delta.x *= -1;
                }

                if (GetBallBound(&ball, TOP) < 0 || GetBallBound(&ball, BOTTOM) > base_line_y) {
                    if (GetBallBound(&ball, TOP) < 0) {
                        SetBallBound(&ball, TOP, 0);
                    } else if (GetBallBound(&ball, BOTTOM) >= base_line_y) {
                        SetBallBound(&ball, BOTTOM, base_line_y - 2);
                        ball.active = false;
                        ball.delta.x = 1;
                        if (!start_set) {
                            start_x = ball.position.x;
                            start_set = true;
                        }
                    }
                    ball.delta.y *= -1;
                }

                if (!ball.active) {
                    balls[i] = ball;
                    continue;
                }

                for (int r = 0; r < grid.rows; r++) {
                    for (int c = 0; c < grid.cols; c++) {
                        if (grid.blocks[r][c].strength == 0)
                            continue;

                        Rectangle block = BlockRect(&grid, r, c);
                        if (CheckCollisionCircleRec(ball.position, BALL_SIZE, block)) {
                            // cout << "collision detected" << endl;
                            grid.blocks[r][c].strength--;
                            switch (CircleRectCollision(ball.position, BALL_SIZE, block)) {
                            case CollisionTop:
                                // cout << "collision top" << endl;
                                ball.delta.y *= -1;
                                break;
                            case CollisionBottom:
                                // cout << "collision bottom" << endl;
                                ball.delta.y *= -1;
                                break;
                            case CollisionLeft:
                                // cout << "collision left" << endl;
                                ball.delta.x *= -1;
                                break;
                            case CollisionRight:
                                // cout << "collision right" << endl;
                                ball.delta.x *= -1;
                                break;
                            }
                        }
                    }
                }
                balls[i] = ball;
            }

            if (all_done) {
                shot_count++;
                is_fired = false;
                ball_offset = 0;
                NewBall(&balls, start_x, start_y);
                ProgressGrid(&grid);
            }
        }

        bool is_down = false;
        if (!is_fired && IsMouseButtonDown(MOUSE_BUTTON_LEFT)) {
            is_aiming = true;
            is_down = true;
        }

        if (is_aiming && is_down) {
            int dx = GetMouseX() - start_x;
            int dy = GetMouseY() - start_y;
            direction = atan2(dy, dx);
        }

        if (is_aiming && !is_down && direction >= 0) {
            is_aiming = false;
            is_fired = true;
            start_set = false;
            for (int i = 0; i < balls.size(); i++) {
                balls[i].position.x = start_x;
                balls[i].active = true;
            }
        }

        BeginDrawing();
        ClearBackground(BLACK);

        string text = format("Shots: {}\n", shot_count);
        DrawText(text.c_str(), 10, 10, 10, WHITE);
        DrawLine(0, base_line_y, sw, base_line_y, WHITE);
        if (is_aiming) {
            int end_x = start_x - AIM_LINE_LENGTH * cos(direction);
            int end_y = start_y - AIM_LINE_LENGTH * sin(direction);

            DrawLine(start_x, start_y, end_x, end_y, WHITE);
        }
        DrawGrid(&grid);
        for (Ball ball : balls) {
            DrawCircle(ball.position.x, ball.position.y, BALL_SIZE, WHITE);
        }

        EndDrawing();
    }

    CloseWindow();

    return 0;
}
