#!/bin/bash
#
# https://github.com/squizlabs/PHP_CodeSniffer

log_message "** Installing phpcs code standards checker "

PHPCS_DIR=$SRC_DIR/phpcs
make_dir $PHPCS_DIR
cd $PHPCS_DIR

# Download the code

curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
if [ 0 -ne $? ]; then exit 1; fi

curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
if [ 0 -ne $? ]; then exit 1; fi

# Install scripts

cd $BIN_DIR

cat<<PHPCS >phpcs
#!/bin/sh
php $PHPCS_DIR/phpcs.phar \$*
PHPCS
chmod u+x phpcs

cat<<PHPCBF >phpcbf
#!/bin/sh
php $PHPCS_DIR/phpcbf.phar \$*
PHPCBF
chmod u+x phpcfb

# Set up configuration file
# phpcs --standard=$PHPCS_DIR/phpcs-xdmod-rules.xml

cat<<EOF >$PHPCS_DIR/phpcs-xdmod-rules.xml
<?xml version="1.0"?>
<ruleset name="XDMoD Standard">
  <description>XDMoD PHP coding standard</description>
  <rule ref="PSR1">?
      <exclude name="PSR1.Files.SideEffects.FoundWithSymbols" />
  </rule>
  <rule ref="PSR2">
      <exclude name="PSR2.Methods.FunctionCallSignature.SpaceBeforeCloseBracket" />
      <exclude name="PSR2.Methods.FunctionClosingBrace.SpacingBeforeClose" />
      <exclude name="PSR2.Classes.PropertyDeclaration.Underscore" />
      <exclude name="PSR2.ControlStructures.ControlStructureSpacing.SpaceBeforeCloseBrace" />
      <exclude name="PSR2.ControlStructures.ControlStructureSpacing.SpacingAfterOpenBrace" />
      <exclude name="Squiz.Functions.MultiLineFunctionDeclaration.BraceOnSameLine" />
      <exclude name="Squiz.ControlStructures.ControlSignature.SpaceAfterCloseBrace" />
      <exclude name="Squiz.ControlStructures.ControlSignature.SpaceAfterCloseParenthesis" />
      <exclude name="Squiz.ControlStructures.ControlSignature.SpaceAfterKeyword" />
      <exclude name="Squiz.ControlStructures.ForEachLoopDeclaration.SpaceAfterOpen" />
      <exclude name="Squiz.ControlStructures.ForEachLoopDeclaration.SpaceBeforeClose" />
      <exclude name="Squiz.WhiteSpace.ControlStructureSpacing.SpacingBeforeClose" />
      <exclude name="Squiz.WhiteSpace.ControlStructureSpacing.SpacingAfterOpen" />
      <exclude name="Squiz.WhiteSpace.ControlStructureSpacing.SpacingAfterOpenBrace" />
      <exclude name="Squiz.Classes.ValidClassName.NotCamelCaps" />
  </rule>
  <rule ref="Generic.Files.LineLength">
      <properties>
          <property name="lineLimit" value="512"/>
          <property name="absoluteLineLimit" value="0"/>
      </properties>
  </rule>
</ruleset>
EOF

exit 0
