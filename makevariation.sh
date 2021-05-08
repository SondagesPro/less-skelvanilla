#!/bin/bash
# Script to make variation, need npm and some extra
# npm install less -g
# npm install clean-css-cli -g
themes=(theme-base theme-button theme-awesome theme-button_awesome )

mkdir variations
for variable in variations-variables/*.less
do
    cat ${variable} > variables.less
    variation=${variable##*/}
    variation=${variation%.*}
    # reset to default
    cat skelvanilla-default/variables-init.less > variables-init.less
    cat skelvanilla-default/variables-skelvanilla.less > variables-skelvanilla.less
    cat skelvanilla-default/variables-select2.less > variables-select2.less
    cat skelvanilla-default/variables-moreselect2.less > variables-moreselect2.less
    cat skelvanilla-default/variables-slider.less > variables-slider.less
    cat skelvanilla-default/customization-bootswatch.less > customization-bootswatch.less
    cat skelvanilla-default/customization-extra.less > customization-extra.less
    # Check if variation exist in each directory
    if [ -r variations-init/${variation}.less ];
    then
        cat variations-init/${variation}.less > variables-init.less
    fi
    if [ -r variations-skelvanilla/${variation}.less ];
    then
        cat variations-skelvanilla/${variation}.less > variables-skelvanilla.less
    fi
    if [ -r variations-select2/${variation}.less ];
    then
        cat variations-select2/${variation}.less > variables-select2.less
    fi
    if [ -r variations-moreselect2/${variation}.less ];
    then
        cat variations-moreselect2/${variation}.less > variables-moreselect2.less
    fi
    if [ -r variations-slider/${variation}.less ];
    then
        cat variations-slider/${variation}.less > variables-slider.less
    fi
    if [ -r customization-bootswatch/${variation}.less ];
    then
        cat customization-bootswatch/${variation}.less > customization-bootswatch.less
    fi
    if [ -r customization-extra/${variation}.less ];
    then
        cat customization-extra/${variation}.less > customization-extra.less
    fi
    # Optimize theme css
    for theme in "${themes[@]}"
    do
        themename=${theme/theme/$variation}
        lessc ${theme}.less variations/${themename}.css
        cleancss variations/${themename}.css > variations/${themename}.min.css
        rm variations/${themename}.css
    done
    echo "variations ${variation} done";
done

# reset to default to make default theme
cat skelvanilla-default/variables-init.less > variables-init.less
cat skelvanilla-default/variables.less > variables.less
cat skelvanilla-default/variables-skelvanilla.less > variables-skelvanilla.less
cat skelvanilla-default/variables-select2.less > variables-select2.less
cat skelvanilla-default/variables-moreselect2.less > variables-moreselect2.less
cat skelvanilla-default/variables-slider.less > variables-slider.less
cat skelvanilla-default/customization-bootswatch.less > customization-bootswatch.less
cat skelvanilla-default/customization-extra.less > customization-extra.less

# make default theme
default=contrast
if [ -r variations-init/${default}.less ];
then
    cat variations-init/${default}.less > variables-init.less
fi
if [ -r variations-select2/${default}.less ];
then
    cat variations-select2/${default}.less > variables-select2.less
fi
if [ -r variations-moreselect2/${default}.less ];
then
    cat variations-moreselect2/${default}.less > variables-moreselect2.less
fi
if [ -r variations-slider/${default}.less ];
then
    cat variations-slider/${default}.less > variables-slider.less
fi
if [ -r variations-skelvanilla/${default}.less ];
then
    cat variations-skelvanilla/${default}.less > variables-skelvanilla.less
fi
if [ -r customization-bootswatch/${default}.less ];
then
    cat customization-bootswatch/${default}.less > customization-bootswatch.less
fi
if [ -r customization-extra/${default}.less ];
then
    cat customization-extra/${default}.less > customization-extra.less
fi
## Add your own needed variables files here , sample
# cat variations-variables/myownvariables.less > variables.less
# cat variations-extra/myownvariables.less > variables.less

# Make lsbootstrap.css with awesome button
lessc --source-map --source-map-rootpath=https://gitlab.com/SondagesPro/SurveyThemes/less-limesurvey/raw/master/ theme-button_awesome.less bootstrap.css

# remove working files
rm variables-init.less
rm variables.less
rm variables-slider.less
rm variables-select2.less
rm variables-moreselect2.less
rm variables-skelvanilla.less
rm customization-extra.less
rm customization-bootswatch.less

echo "All variations done, you can copy boostrap.css, bootstrap.css.map and variations directiry to your css directory in Skelvanilla LimeSurvey theme"
