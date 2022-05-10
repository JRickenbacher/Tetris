from operator import mod
import pygame
import random

num_rows = 24
num_cols = 10

# Rotations: https://strategywiki.org/wiki/Tetris/Rotation_systems

# Colors: https://colorswall.com/palette/90259/
colors = [(255, 255, 255),
            (0, 255, 255), # I
            (255, 255, 0), # O
            (0, 0, 255), # J
            (255, 127, 0), # L
            (0, 255, 0), # S
            (128, 0, 128), # T
            (255, 0, 0)] # Z

class Tetromino_Parent(object):

    def __init__(self):
        self.cubes = [0,0,0,0]
        self.rotation = 0
        self.tet_num = 0
        self.active = True

    def rotate(self, board):
        pass

    def can_move_down(self, board):
        for x in range(len(self.cubes)):
            if (self.cubes[x] + num_cols > num_cols * num_rows - 1) or (board[self.cubes[x] + num_cols][0] == 5):
                self.active = False
                return False
        return True

    def can_move_left(self, board):
        for x in range(len(self.cubes)):
            if (self.cubes[x] % num_cols == 0) or (board[self.cubes[x] - 1][0] == 5):
                return False
        return True

    def can_move_right(self, board):
        for x in range(len(self.cubes)):
            if (self.cubes[x] % num_cols == num_cols - 1) or (board[self.cubes[x] + 1][0] == 5):
                return False
        return True

    def move_down(self, board):
        if self.can_move_down(board):
            self.cubes[:] = [x + num_cols for x in self.cubes]

    def move_left(self, board):
        if self.can_move_left(board):
            self.cubes[:] = [x - 1 for x in self.cubes]

    def move_right(self, board):
        if self.can_move_right(board):
            self.cubes[:] = [x + 1 for x in self.cubes]

class Tetromino_I(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 - 2,
                    num_cols // 2 - 1,
                    num_cols // 2,
                    num_cols // 2 + 1]
        self.rotation = 0
        self.tet_num = 1
        self.active = True


        # Rotation 0:
        #   1   2   3   4

        # Rotation 1:
        #           1
        #           2
        #           3  
        #           4

    def rotate(self, board):
        next_cubes = [self.cubes[0] + (-1)**(self.rotation) * (2 - num_cols * 2),
                        self.cubes[1] + (-1)**(self.rotation) * (1 - num_cols),
                        self.cubes[2],
                        self.cubes[3] + (-1)**(self.rotation) * (num_cols - 1)]
        if (all((loc < len(board)) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):

                if self.rotation == 0:
                    if ((next_cubes[0] // num_cols) >= 1) and ((next_cubes[0] // num_cols) != num_rows - 1):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if ((next_cubes[0] % num_cols) >= 1) and ((next_cubes[0] % num_cols) != num_cols):
                        self.cubes = next_cubes
                        self.rotation = 0

class Tetromino_O(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 - 1,
                    num_cols // 2,
                    num_cols // 2 - 1 + num_cols,
                    num_cols // 2 + num_cols]
        self.rotation = 0
        self.tet_num = 2
        self.active = True


        # Rotation 0:
        #       1   2
        #       3   4

    def rotate(self, board):
        pass

class Tetromino_J(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 - 2,
                    num_cols // 2 - 1,
                    num_cols // 2,
                    num_cols // 2 + num_cols]
        self.rotation = 0
        self.tet_num = 3
        self.active = True


        # Rotation 0:
        #
        #   1   2   3
        #           4

        # Rotation 1:
        #       1
        #       2
        #   4   3

        # Rotation 2:
        #   4   
        #   3   2   1
        #

        # Rotation 3:
        #       3   4   
        #       2
        #       1

    def rotate(self, board):
        next_cube4 = self.cubes[3] - 2
        if self.rotation == 1:
            next_cube4 = self.cubes[3] - 2 * num_cols
        elif self.rotation == 2:
            next_cube4 = self.cubes[3] + 2
        elif self.rotation == 3:
            next_cube4 = self.cubes[3] + 2 * num_cols
        next_cubes = [self.cubes[0] + (-1)**(self.rotation // 2) + (-1)**((self.rotation + 3) // 2) * num_cols,
                        self.cubes[1],
                        self.cubes[2] + (-1)**((self.rotation + 2) // 2) + (-1)**((self.rotation + 1) // 2) * num_cols,
                        next_cube4]
        if (all((loc < len(board) and loc > 0) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):
                if self.rotation == 0:
                    if (self.cubes[0] // num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if (self.cubes[0] % num_cols != num_cols - 1):
                        self.cubes = next_cubes
                        self.rotation = 2

                elif self.rotation == 2:
                    if (self.cubes[0] // num_cols != num_rows - 1):
                        self.cubes = next_cubes
                        self.rotation = 3

                elif self.rotation == 3:
                    if (self.cubes[0] % num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 0
        

class Tetromino_L(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2,
                    num_cols // 2 - 1,
                    num_cols // 2 - 2,
                    num_cols // 2 - 2 + num_cols]
        self.rotation = 0
        self.tet_num = 4
        self.active = True

        # Rotation 0:
        #
        #   3   2   1
        #   4

        # Rotation 1:
        #   4   3 
        #       2    
        #       1

        # Rotation 2:
        #           4 
        #   1   2   3
        #       

        # Rotation 1:
        #       1 
        #       2    
        #       3   4

    def rotate(self, board):
        next_cube4 = self.cubes[3] - 2 * num_cols
        if self.rotation == 1:
            next_cube4 = self.cubes[3] + 2
        elif self.rotation == 2:
            next_cube4 = self.cubes[3] + 2 * num_cols
        elif self.rotation == 3:
            next_cube4 = self.cubes[3] - 2
        next_cubes = [self.cubes[0] + (-1)**((self.rotation + 2)// 2) + (-1)**((self.rotation + 1) // 2) * num_cols,
                        self.cubes[1],
                        self.cubes[2] + (-1)**(self.rotation // 2) + (-1)**((self.rotation + 3) // 2) * num_cols,
                        next_cube4]
        if (all((loc < len(board) and loc > 0) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):
                if self.rotation == 0:
                    if (self.cubes[0] // num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if (self.cubes[0] % num_cols != num_cols - 1):
                        self.cubes = next_cubes
                        self.rotation = 2

                elif self.rotation == 2:
                    if (self.cubes[0] // num_cols != num_rows - 1):
                        self.cubes = next_cubes
                        self.rotation = 3

                elif self.rotation == 3:
                    if (self.cubes[0] % num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 0

class Tetromino_S(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 - 2 + num_cols,
                    num_cols // 2 - 1 + num_cols,
                    num_cols // 2 - 1,
                    num_cols // 2]
        self.rotation = 0
        self.tet_num = 5
        self.active = True

        # Rotation 0:
        #
        #       3   4
        #   1   2

        # Rotation 1:
        #       4
        #       3   2
        #           1

    def rotate(self, board):
        next_cubes = [self.cubes[0] + 2,
                        self.cubes[3],
                        self.cubes[2],
                        self.cubes[3] - 1 - num_cols]
        if self.rotation == 1:
            next_cubes = [self.cubes[0] - 2,
                        self.cubes[1] - 1 + num_cols,
                        self.cubes[2],
                        self.cubes[1]]
        if (all((loc < len(board)) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):

                if self.rotation == 0:
                    if (self.cubes[3] // num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if (self.cubes[3] % num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 0

class Tetromino_T(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 - 2,
                    num_cols // 2 - 1,
                    num_cols // 2,
                    num_cols // 2 - 1 + num_cols]
        self.rotation = 0
        self.tet_num = 6
        self.active = True

        # Rotation 0:
        #
        #   1   2   3
        #       4

        # Rotation 1:
        #       1
        #   4   2
        #       3

        # Rotation 2:
        #       4
        #   3   2   1
        # 

        # Rotation 3:
        #       3
        #       2   4
        #       1

    def rotate(self, board):
        next_cubes = [self.cubes[0] + (-1)**(self.rotation // 2) + (-1)**((self.rotation + 3) // 2) * num_cols,
                        self.cubes[1],
                        self.cubes[3],
                        self.cubes[0]]
        if (all((loc < len(board) and loc > 0) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):
                if self.rotation == 0:
                    if (self.cubes[0] // num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if (self.cubes[0] % num_cols != num_cols - 1):
                        self.cubes = next_cubes
                        self.rotation = 2

                elif self.rotation == 2:
                    if (self.cubes[0] // num_cols != num_rows - 1):
                        self.cubes = next_cubes
                        self.rotation = 3

                elif self.rotation == 3:
                    if (self.cubes[0] % num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 0

class Tetromino_Z(Tetromino_Parent):

    def __init__(self):
        self.cubes = [num_cols // 2 + num_cols,
                    num_cols // 2 - 1 + num_cols,
                    num_cols // 2 - 1,
                    num_cols // 2 - 2]
        self.rotation = 0
        self.tet_num = 7
        self.active = True

        # Rotation 0:
        #
        #   4   3
        #       2   1

        # Rotation 1:
        #           1
        #       3   2
        #       4 

    def rotate(self, board):
        next_cubes = [self.cubes[0] - 2 * num_cols,
                        self.cubes[1] + 1 - num_cols,
                        self.cubes[2],
                        self.cubes[1]]
        if self.rotation == 1:
            next_cubes = [self.cubes[0] + 2 * num_cols,
                        self.cubes[3],
                        self.cubes[2],
                        self.cubes[3] - 1 - num_cols]
        if (all((loc < len(board)) for loc in next_cubes)):
            if (board[next_cubes[0]][0] != 5) and (board[next_cubes[1]][0] != 5) and (board[next_cubes[2]][0] != 5) and (board[next_cubes[3]][0] != 5):

                if self.rotation == 0:
                    if (self.cubes[3] // num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 1

                elif self.rotation == 1:
                    if (self.cubes[3] % num_cols != 0):
                        self.cubes = next_cubes
                        self.rotation = 0

class Game_Board(object):

    tetromino = None
    x = 100
    y = 60
    zoom = 20

    def __init__(self, rows, cols):
        self.state = "start"
        self.board = [[0, 0]]*(rows*cols)
        self.score = 0
        self.level = 2

    def new_tetromino(self):
        next_piece = random.randint(1, 7)
        if next_piece == 1:
            self.tetromino = Tetromino_I()
        elif next_piece == 2:
            self.tetromino = Tetromino_O()
        elif next_piece == 3:
            self.tetromino = Tetromino_J()
        elif next_piece == 4:
            self.tetromino = Tetromino_L()
        elif next_piece == 5:
            self.tetromino = Tetromino_S()
        elif next_piece == 6:
            self.tetromino = Tetromino_T()
        elif next_piece == 7:
            self.tetromino = Tetromino_Z()

    def check_lines(self):
        rows_to_check = []
        for x in range(len(self.tetromino.cubes)):
            if (self.tetromino.cubes[x] // num_cols) not in rows_to_check:
                rows_to_check.append(self.tetromino.cubes[x] // num_cols)

        rows_to_check.sort(reverse=True)

        for row in rows_to_check:
            clear_col = True
            for j in range(num_cols):
                if (self.board[row * num_cols + j][0] != 5):
                    clear_col = False
                    break
            if clear_col:
                self.score = self.score + 1
                for x in reversed(range(num_cols * (row+1))):
                    if (x < num_cols):
                        self.board[x] = [0,0]
                    else:
                        self.board[x] = self.board[x - num_cols]
                rows_to_check[:] = [k + 1 for k in rows_to_check]

    def check_gameover(self):
        for x in range(len(self.tetromino.cubes)):
            if (self.tetromino.cubes[x] // num_cols == 0): #Kinda hacky. come back to
                self.state = "gameover"

    def update_board(self):
        for i in range(len(self.board)):
            if (self.board[i][0] != 5):
                self.board[i] = [0, 0] 

        for x in range(len(self.tetromino.cubes)):
            if (self.tetromino.active):
                self.board[self.tetromino.cubes[x]] = [x + 1, self.tetromino.tet_num]
            else:
                self.board[self.tetromino.cubes[x]] = [5, self.tetromino.tet_num]

        if not(self.tetromino.active):
            self.check_lines()
            self.check_gameover()
            if self.state != "gameover":
                self.tetromino = self.new_tetromino()

# Pygame stuff: https://levelup.gitconnected.com/writing-tetris-in-python-2a16bddb5318
# Initialize the game engine
pygame.init()

# Define some colors
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GRAY = (128, 128, 128)

size = (400, 600)
screen = pygame.display.set_mode(size)

pygame.display.set_caption("Tetris")

# Loop until the user clicks the close button.
done = False
clock = pygame.time.Clock()
fps = 25
game = Game_Board(num_rows, num_cols)
counter = 0

pressing_down = False

pressing_left = False
left_counter = 0

pressing_right = False
right_counter = 0

shift_wait = 2 #Frames you wait for going left or right

while not done:
    if game.tetromino is None:
        game.new_tetromino()
    counter += 1
    if counter > 100000:
        counter = 0

    if counter % (fps // game.level // 2) == 0 or pressing_down:
        if game.state == "start":
            game.tetromino.move_down(game.board)

    if pressing_left:
        if game.state == "start":
            left_counter = left_counter + 1
            if left_counter == 3:
                game.tetromino.move_left(game.board)
                left_counter = 0

    if pressing_right:
        if game.state == "start":
            right_counter = right_counter + 1
            if right_counter == 3:
                game.tetromino.move_right(game.board)
                right_counter = 0

    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            done = True
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_UP:
                game.tetromino.rotate(game.board)
            if event.key == pygame.K_DOWN:
                pressing_down = True
            if event.key == pygame.K_LEFT:
                # pressing_left = True
                game.tetromino.move_left(game.board)
            if event.key == pygame.K_RIGHT:
                # pressing_right = True
                game.tetromino.move_right(game.board)
            if event.key == pygame.K_SPACE:
                # game.go_space()
                pass
            if event.key == pygame.K_ESCAPE:
                game = Game_Board(num_rows, num_cols)
                game.new_tetromino()

    if event.type == pygame.KEYUP:
            if event.key == pygame.K_DOWN:
                pressing_down = False
            if event.key == pygame.K_LEFT:
                pressing_left = False
                left_counter = 0
            if event.key == pygame.K_RIGHT:
                pressing_right = False
                left_counter = 0

    screen.fill(WHITE)

    for i in range(len(game.board)):
        row = i // num_cols
        col = i % num_cols
        pygame.draw.rect(screen, GRAY, [game.x + game.zoom * col, game.y + game.zoom * row, game.zoom, game.zoom], 1)
        if game.board[i][0] > 0:
            pygame.draw.rect(screen, colors[game.board[i][1]],
                                [game.x + game.zoom * col + 1, game.y + game.zoom * row + 1, game.zoom - 2, game.zoom - 1])


    font = pygame.font.SysFont('Calibri', 25, True, False)
    font1 = pygame.font.SysFont('Calibri', 65, True, False)
    text = font.render("Score: " + str(game.score), True, BLACK)
    text_game_over = font1.render("Game Over", True, (255, 125, 0))
    text_game_over1 = font1.render("Press ESC", True, (255, 215, 0))

    screen.blit(text, [0, 0])
    if game.state == "gameover":
        screen.blit(text_game_over, [20, 200])
        screen.blit(text_game_over1, [25, 265])

    pygame.display.flip()
    clock.tick(fps)

    game.update_board()

pygame.quit()