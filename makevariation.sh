#!/bin/bash
themes=(theme-base theme-button theme-awesome theme-button_awesome )

mkdir variations
for variable in variations-variables/*.less
do
    cat ${variable} > variables.less
    variation=${variable##*/}
    variation=${variation%.*}
    cat variations-morevariables/contrast.less > morevariables.less
    if [ -r variations-morevariables/${variation}.less ];
    then
        cat variations-morevariables/${variation}.less > morevariables.less
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
# reset to default
cat variations-variables/contrast.less > variables.less
cat variations-morevariables/contrast.less > morevariables.less
lessc --source-map --source-map-rootpath=https://gitlab.com/SondagesPro/SurveyThemes/less-limesurvey/raw/master/ theme-button.less lsbootstrap.css

echo "All variations done, you can use at variations with skelvanilla"
