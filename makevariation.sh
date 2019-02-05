#!/bin/bash
themes=(theme-base theme-button theme-awesome theme-button_awesome )

mkdir variations
for variable in variations-variables/*.less
do
    cat ${variable} > variables.less
    variation=${variable##*/}
    variation=${variation%.*}
    cat skelvanilla-default/variables-init.less > variables-init.less
    cat skelvanilla-default/variables-skelvanilla.less > variables-skelvanilla.less
    cat skelvanilla-default/variables-bootswatch.less > variables-bootswatch.less
    cat skelvanilla-default/variables-slider.less > variables-slider.less
    if [ -r variations-init/${variation}.less ];
    then
        cat variations-init/${variation}.less > variables-init.less
    fi
    if [ -r variations-skelvanilla/${variation}.less ];
    then
        cat variations-skelvanilla/${variation}.less > variables-skelvanilla.less
    fi
    if [ -r variations-bootswatch/${variation}.less ];
    then
        cat variations-bootswatch/${variation}.less > variables-bootswatch.less
    fi
    if [ -r variations-slider/${variation}.less ];
    then
        cat variations-slider/${variation}.less > variables-slider.less
    fi
    for theme in "${themes[@]}"
    do
        themename=${theme/theme/$variation}
        lessc ${theme}.less variations/${themename}.css
        cleancss variations/${themename}.css > variations/${themename}.min.css
        rm variations/${themename}.css
    done
    echo "variations ${variation} done";
done
# Make lsbootstrap.css with contrast button
cat variations-init/contrast.less > variables-init.less
cat variations-variables/contrast.less > variables.less
cat variations-skelvanilla/contrast.less > variables-skelvanilla.less
cat skelvanilla-default/variables-bootswatch.less > variables-bootswatch.less
cat skelvanilla-default/variables-slider.less > variables-slider.less

lessc --source-map --source-map-rootpath=https://gitlab.com/SondagesPro/SurveyThemes/less-limesurvey/raw/master/ theme-button.less lsbootstrap.css

echo "All variations done, you can use at variations with skelvanilla"
