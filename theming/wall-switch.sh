DIR=$HOME/.dotfiles/theming/walls/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]} ]}
swww img ${DIR}/${RANDOMPICS} --transition-duration 2 --transition-fps 30 --transition-type any
