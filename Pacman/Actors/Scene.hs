module Pacman.Actors.Scene (Scene(..), initialScene, update) where

import Pacman.Actors.Base

import qualified Pacman.Actors.Pacman as Pacman
import qualified Pacman.Actors.Ghost as Ghost

data Scene = Scene { width :: Int,
                     height :: Int,
                     pacman :: Pacman.Pacman,
                     ghosts :: [Ghost.Ghost]
                   }

update :: Scene -> Float -> Scene
update scene dt = Scene {
                        width = width scene,
                        height = height scene,
                        pacman = Pacman.update (pacman scene) dt,
                        ghosts = map (\x -> Ghost.update x dt) (ghosts scene)
                     }

initialScene = Scene {
    width = 800, 
    height = 600,
    pacman = Pacman.Pacman {
        Pacman.position = (300, 300),
        Pacman.mouthAngle = 0,
        Pacman.mouthAction = Pacman.Opening,
        Pacman.direction = DRight,
        Pacman.queuedDirection = Nothing
    },
    ghosts = []}

