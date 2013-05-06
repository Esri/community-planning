# Building the Sample Community Planning App

## Requirements

* Adobe Flash Builder with the 4.6 version of
[Adobe's Flex SDK](http://www.adobe.com/devnet/flex/flex-sdk-download.html).

* If you are using automatic builds,
    1. install Apache Ant 1.8.2 or later - [About](http://ant.apache.org/)
    2. set the path to the FlashBuilderC.exe command-line compiler in file flexbuild.bat

## How To Set Up for All Builds

These steps set up a Flash Builder workspace for this project and then save it into a zip so that the
build process has fresh ingredients to fall back upon in the case of workspace corruption.

1. Download Esri's
[ArcGIS Viewer 3.3 for Flex](https://github.com/Esri/arcgis-viewer-flex/archive/master.zip)
from GitHub

2. From the ArcGIS Viewer for Flex zip, extract its top-level folder into into your public-safety-cop folder
and add two underscores to the front of its name so that git will ignore it; discard the zip. For the
instructions below, we'll assume that the top-level folder's name is "__arcgis-viewer-flex-master".

3. Download Esri's
[ArcGIS API 3.3 for Flex](http://resources.arcgis.com/en/communities/flex-api/)
from Esri

4. From the ArcGIS API for Flex zip, extract the file ArcGIS_Flex\libs\agslib-3.3-2013-04-24.swc
into the __arcgis-viewer-flex-master\libs folder; discard the zip

5. Start Flash Builder and specify the full path of the community-planning folder as your workspace
(the workspace needs to be one folder level above the project (arcgis-viewer-flex-master) folder that we just created)

6. Import a Flash Builder project, and choose the __arcgis-viewer-flex-master folder as your project
folder; cancel the build if one starts automatically. It's OK if you get the warning that the project will be
upgraded because it was created with a previous version of Flash Builder.

7. Exit Flash Builder and delete the __arcgis-viewer-flex-master\bin-debug and
__arcgis-viewer-flex-master\bin-release folders if present

8. Zip the __arcgis-viewer-flex-master folder into __arcgis-viewer-flex-master.zip
so that the top-level item in the zip is the __arcgis-viewer-flex-master folder

## How To Run Automatic Builds

The Ant program uses the instructions in the file build.xml to unzip a fresh copy of the workspace,
copy the widget and other sources into the workspace, build the widgets, and copy them into the
__distrib distribution directory.

1. At the Windows command line in the community-planning folder, type "ant" to start the Ant build; your
compiled widgets will be put into the folder community-planning\__distrib

The script does not delete the __arcgis-viewer-flex-master folder that it creates, so
you can use Flash Builder and the community-planning workspace for interactive development and testing.

## How To Complete Set Up for Manual Builds

1. Copy folder "libs"
into the __arcgis-viewer-flex-master folder;
confirm folder replace for all items (nothing is actually replaced)

2. Copy the contents of folder "config"
into the __arcgis-viewer-flex-master\src folder;
confirm replacement of config.xml

3. Copy the contents of folder "widgetConfigsOnly"
into the __arcgis-viewer-flex-master\src\widgets folder;
confirm folder replace for all items (nothing is actually replaced)

4. Copy folders "assets", "com", org", "popups", and "widgets"
into the __arcgis-viewer-flex-master\src folder;
confirm folder replace for all items (nothing is actually replaced)

5. Start Flash Builder with the community-planning workspace

6. Right-click on the __arcgis-viewer-flex-master project name in the Package Explorer window and
select Properties

7. Go to the Flex Modules section

8. Add the module sources
CommunityImpact.mxml, CommunityPlanning.mxml, ReviewPlan.mxml, and SharePlan.mxml
to the build list for the project

You can now use Flash Builder and the community-planning workspace for interactive development and testing.
