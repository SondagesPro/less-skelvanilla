#!/bin/bash
themes=(theme-base theme-button theme-awesome theme-button_awesome )

mkdir variations
for variable in variations-variables/*.less
do
    cat ${variable} > variables.less
    for theme in "${themes[@]}"
    do
        themename=${variable##*/}
        themename=${themename%.*}
        themename=${theme/theme/$themename}
        lessc ${theme}.less variations/${themename}.css
        cleancss variations/${themename}.css > variations/${themename}.min.css
        rm variations/${themename}.css
    done
done
cat variations-variables/contrast.less > variables.less
echo "All variations done, you can use at variations with skelvanilla"
