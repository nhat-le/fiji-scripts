macro "Z Project and Concat [c]" {
	origStack = getTitle();
	// Make substack
	numChannels = getNumber("Enter number of channels:", 2);

	for(i = 1; i <= numChannels; i++)
	{
		selectWindow(origStack);
		run("Make Substack...", "  slices=" + i + "-" + nSlices + "-" + numChannels);
	    run("Enhance Contrast", "saturated=0.35");
	    titleOriginal = getTitle();
	    titleShort = replace (titleOriginal, ".tif","");
	    run("Z Project...", "projection=[Average Intensity]");
	    run("Set... ", "zoom=80 x=256 y=256");
	    run("Enhance Contrast", "saturated=0.35");
	}

	//selectWindow(origStack);
	//run("Close");
    //titleZAvg=getTitle();
    //run("Concatenate...", "  title=[" + titleShort + "-reg] image1=" + titleZAvg + " image2=" + titleOriginal + " image3=[-- None --]");
}

macro "Separate channels [s]" {
	origStack = getTitle();
	// Make substack
	numChannels = getNumber("Enter number of channels:", 2);

	for(i = 1; i <= numChannels; i++)
	{
		selectWindow(origStack);
		run("Make Substack...", "  slices=" + i + "-" + nSlices + "-" + numChannels);
	    run("Enhance Contrast", "saturated=0.35");
	    titleOriginal = getTitle();
	    titleShort = replace (titleOriginal, ".tif","");
	    run("Z Project...", "projection=[Average Intensity]");
	    run("Set... ", "zoom=80 x=256 y=256");
	    run("Enhance Contrast", "saturated=0.35");
	}

	//selectWindow(origStack);
	//run("Close");
    //titleZAvg=getTitle();
    //run("Concatenate...", "  title=[" + titleShort + "-reg] image1=" + titleZAvg + " image2=" + titleOriginal + " image3=[-- None --]");
}





// "StartupMacros"
// The macros and macro tools in this file ("StartupMacros.txt") are
// automatically installed in the Plugins>Macros submenu and
//  in the tool bar when ImageJ starts up.

//  About the drawing tools.
//
//  This is a set of drawing tools similar to the pencil, paintbrush,
//  eraser and flood fill (paint bucket) tools in NIH Image. The
//  pencil and paintbrush draw in the current foreground color
//  and the eraser draws in the current background color. The
//  flood fill tool fills the selected area using the foreground color.
//  Hold down the alt key to have the pencil and paintbrush draw
//  using the background color or to have the flood fill tool fill
//  using the background color. Set the foreground and background
//  colors by double-clicking on the flood fill tool or on the eye
//  dropper tool.  Double-click on the pencil, paintbrush or eraser
//  tool  to set the drawing width for that tool.
//
// Icons contributed by Tony Collins.

// Global variables
var pencilWidth=1,  eraserWidth=10, leftClick=16, alt=8;
var brushWidth = 10; //call("ij.Prefs.get", "startup.brush", "10");
var floodType =  "8-connected"; //call("ij.Prefs.get", "startup.flood", "8-connected");

// The macro named "AutoRunAndHide" runs when ImageJ starts
// and the file containing it is not displayed when ImageJ opens it.

// macro "AutoRunAndHide" {}

function UseHEFT {
	requires("1.38f");
	state = call("ij.io.Opener.getOpenUsingPlugins");
	if (state=="false") {
		setOption("OpenUsingPlugins", true);
		showStatus("TRUE (images opened by HandleExtraFileTypes)");
	} else {
		setOption("OpenUsingPlugins", false);
		showStatus("FALSE (images opened by ImageJ)");
	}
}

UseHEFT();

// The macro named "AutoRun" runs when ImageJ starts.

macro "AutoRun" {
	// run all the .ijm scripts provided in macros/AutoRun/
	autoRunDirectory = getDirectory("imagej") + "/macros/AutoRun/";
	if (File.isDirectory(autoRunDirectory)) {
		list = getFileList(autoRunDirectory);
		// make sure startup order is consistent
		Array.sort(list);
		for (i = 0; i < list.length; i++) {
			if (endsWith(list[i], ".ijm")) {
				runMacro(autoRunDirectory + list[i]);
			}
		}
	}
}
var pmCmds = newMenu("Popup Menu",
	newArray("Help...", "Rename...", "Duplicate...", "Original Scale",
	"Paste Control...", "-", "Record...", "Capture Screen ", "Monitor Memory...",
	"Find Commands...", "Control Panel...", "Startup Macros...", "Search..."));

macro "Popup Menu" {
	cmd = getArgument();
	if (cmd=="Help...")
		showMessage("About Popup Menu",
			"To customize this menu, edit the line that starts with\n\"var pmCmds\" in ImageJ/macros/StartupMacros.txt.");
	else
		run(cmd);
}
macro "Abort Macro or Plugin (or press Esc key) Action Tool - CbooP51b1f5fbbf5f1b15510T5c10X" {
	setKeyDown("Esc");
}
var xx = requires138b(); // check version at install
function requires138b() {requires("1.38b"); return 0; }
var dCmds = newMenu("Developer Menu Tool",
newArray("ImageJ Website","News", "Documentation", "ImageJ Wiki", "Resources", "Macro Language", "Macros",
	"Macro Functions", "Startup Macros...", "Plugins", "Source Code", "Mailing List Archives", "-", "Record...",
	"Capture Screen ", "Monitor Memory...", "List Commands...", "Control Panel...", "Search...", "Debug Mode"));
macro "Developer Menu Tool - C037T0b11DT7b09eTcb09v" {
	xo
	if (cmd=="ImageJ Website")
		run("URL...", "url=http://rsbweb.nih.gov/ij/");
	else if (cmd=="News")
		run("URL...", "url=http://rsbweb.nih.gov/ij/notes.html");
	else if (cmd=="Documentation")
		run("URL...", "url=http://rsbweb.nih.gov/ij/docs/");
	else if (cmd=="ImageJ Wiki")
		run("URL...", "url=http://imagejdocu.tudor.lu/imagej-documentation-wiki/");
	else if (cmd=="Resources")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/");
	else if (cmd=="Macro Language")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/macro/macros.html");
	else if (cmd=="Macros")
		run("URL...", "url=http://rsbweb.nih.gov/ij/macros/");
	else if (cmd=="Macro Functions")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/macro/functions.html");
	else if (cmd=="Plugins")
		run("URL...", "url=http://rsbweb.nih.gov/ij/plugins/");
	else if (cmd=="Source Code")
		run("URL...", "url=http://rsbweb.nih.gov/ij/developer/source/");
	else if (cmd=="Mailing List Archives")
		run("URL...", "url=https://list.nih.gov/archives/imagej.html");
	else if (cmd=="Debug Mode")
		setOption("DebugMode", true);
	else if (cmd!="-")
		run(cmd);
}
var sCmds = newMenu("Stacks Menu Tool",
	newArray("Add Slice", "Delete Slice", "Next Slice [>]", "Previous Slice [<]", "Set Slice...", "-",
		"Convert Images to Stack", "Convert Stack to Images", "Make Montage...", "Reslice [/]...", "Z Project...",
		"3D Project...", "Plot Z-axis Profile", "-", "Start Animation", "Stop Animation", "Animation Options...",
		"-", "MRI Stack (528K)"));
macro "Stacks Menu Tool - C037T0b11ST8b09tTcb09k" {
	cmd = getArgument();
	if (cmd!="-") run(cmd);
}
var luts = getLutMenu();
var lCmds = newMenu("LUT Menu Tool", luts);
macro "LUT Menu Tool - C037T0b11LT6b09UTcb09T" {
	cmd = getArgument();
	if (cmd!="-") run(cmd);
}
function getLutMenu() {
	list = getLutList();
	menu = newArray(16+list.length);
	menu[0] = "Invert LUT"; menu[1] = "Apply LUT"; menu[2] = "-";
	menu[3] = "Fire"; menu[4] = "Grays"; menu[5] = "Ice";
	menu[6] = "Spectrum"; menu[7] = "3-3-2 RGB"; menu[8] = "Red";
	menu[9] = "Green"; menu[10] = "Blue"; menu[11] = "Cyan";
	menu[12] = "Magenta"; menu[13] = "Yellow"; menu[14] = "Red/Green";
	menu[15] = "-";
	for (i=0; i<list.length; i++)
		menu[i+16] = list[i];
	return menu;
}
function getLutList() {
	lutdir = getDirectory("luts");
	list = newArray("No LUTs in /ImageJ/luts");
	if (!File.exists(lutdir))
		return list;
	rawlist = getFileList(lutdir);
	if (rawlist.length==0)
		return list;
	count = 0;
	for (i=0; i< rawlist.length; i++)
		if (endsWith(rawlist[i], ".lut")) count++;
	if (count==0)
		return list;
	list = newArray(count);
	index = 0;
	for (i=0; i< rawlist.length; i++) {
		if (endsWith(rawlist[i], ".lut"))
			list[index++] = substring(rawlist[i], 0, lengthOf(rawlist[i])-4);
	}
	return list;
}
macro "Pencil Tool - C037L494fL4990L90b0Lc1c3L82a4Lb58bL7c4fDb4L5a5dL6b6cD7b" {
	getCursorLoc(x, y, z, flags);
	if (flags&alt!=0)
		setColorToBackgound();
	draw(pencilWidth);
}
macro "Paintbrush Tool - C037La077Ld098L6859L4a2fL2f4fL3f99L5e9bL9b98L6888L5e8dL888c" {
	getCursorLoc(x, y, z, flags);
	if (flags&alt!=0)
		setColorToBackgound();
	draw(brushWidth);
}
macro "Flood Fill Tool -C037B21P085373b75d0L4d1aL3135L4050L6166D57D77D68La5adLb6bcD09D94" {
	requires("1.34j");
	setupUndo();
	getCursorLoc(x, y, z, flags);
	if (flags&alt!=0) setColorToBackgound();
	floodFill(x, y, floodType);
}
function draw(width) {
	requires("1.32g");
	setupUndo();
	getCursorLoc(x, y, z, flags);
	setLineWidth(width);
	moveTo(x,y);
	x2=-1; y2=-1;
	while (true) {
		getCursorLoc(x, y, z, flags);
		if (flags&leftClick==0) exit();
		if (x!=x2 || y!=y2)
			lineTo(x,y);
		x2=x; y2 =y;
		wait(10);
	}
}
function setColorToBackgound() {
	savep = getPixel(0, 0);
	makeRectangle(0, 0, 1, 1);
	run("Clear");
	background = getPixel(0, 0);
	run("Select None");
	setPixel(0, 0, savep);
	setColor(background);
}
// Runs when the user double-clicks on the pencil tool icon
macro 'Pencil Tool Options...' {
	pencilWidth = getNumber("Pencil Width (pixels):", pencilWidth);
}

// Runs when the user double-clicks on the paint brush tool icon
macro 'Paintbrush Tool Options...' {
	brushWidth = getNumber("Brush Width (pixels):", brushWidth);
	call("ij.Prefs.set", "startup.brush", brushWidth);
}
// Runs when the user double-clicks on the flood fill tool icon
macro 'Flood Fill Tool Options...' {
	Dialog.create("Flood Fill Tool");
	Dialog.addChoice("Flood Type:", newArray("4-connected", "8-connected"), floodType);
	Dialog.show();
	floodType = Dialog.getChoice();
	call("ij.Prefs.set", "startup.flood", floodType);
}
macro "Set Drawing Color..."{
	run("Color Picker...");
}
macro "-" {} //menu divider
macro "About Startup Macros..." {
	title = "About Startup Macros";
	text = "Macros, such as this one, contained in a file named\n"
		+ "'StartupMacros.txt', located in the 'macros' folder inside the\n"
		+ "Fiji folder, are automatically installed in the Plugins>Macros\n"
		+ "menu when Fiji starts.\n"
		+ "\n"
		+ "More information is available at:\n"
		+ "<http://imagej.nih.gov/ij/developer/macro/macros.html>";
	dummy = call("fiji.FijiTools.openEditor", title, text);
}
macro "Save As JPEG... [j]" {
	quality = call("ij.plugin.JpegWriter.getQuality");
	quality = getNumber("JPEG quality (0-100):", quality);
	run("Input/Output...", "jpeg="+quality);
	saveAs("Jpeg");
}
macro "Save Inverted FITS" {
	run("Flip Vertically");
	run("FITS...", "");
	run("Flip Vertically");
}
// Macro converts files from LSM to Jpeg. For Danielle and the avoidance of death by anxiety, July 2015.
macro "LSMConvert...[L]" {
	open("");
	saveName = getTitle();
	//run("Set Scale...", "distance=0.569 known=1 pixel=1 unit=µm");
	imageType = getString("Type of image (Tile or Inset): ", "Tile");
	run("Channels Tool...");
	Stack.setDisplayMode("composite");
	Stack.setActiveChannels("011");
	run("Make Composite");
	run("RGB Color");
	//run("Scale Bar...", "width=50 height=5 font=18 color=White background=None location=[Lower Right] bold hide");
	if (imageType == "Tile")
		run("Scale Bar...", "width=200 height=20 font=18 color=White background=None location=[Lower Right] bold hide");
	else //if (imageType == "Inset")
		run("Scale Bar...", "width=50 height=5 font=18 color=White background=None location=[Lower Right] bold hide");
	saveAs("Jpeg");
}

macro "Save as Tiff [s]" {
	//path = File.openDialog("Select a file to save");
	saveAs("Tiff");
}

macro "Auto Template Registration...[6]" {
	// Macro to automate a double registration using Template Matching plugin.
	//Select directory containing original .tif files
	//directory = getDirectory("");
	//Select file to register - one channel at a time.
	path = File.openDialog("Select a file to register...");
	open(path);
	directory = File.getParent(path);
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","");
	// Generate z projection to use for alignment.
	run("Z Project...", "projection=[Average Intensity]");
	titleZAvg=getTitle();
	fullPath = directory + "\\" + titleOriginal;
	run("Concatenate...", "  title=[" + titleShort + "-reg] image1=" + titleZAvg + " image2=" + titleOriginal + " image3=[-- None --]");
	titleReg1=getTitle();
	//Select area for alignment template
	setTool("rectangle");
	waitForUser("Make selection...")
	Roi.getBounds(x, y, width, height);
	//Run alignment, first pass
	run("Align slices in stack...", "method=5 windowsizex=" + width + " windowsizey=" + height + " x0=" + x + " y0=" + y + " swindow=0 subpixel=true itpmethod=1 ref.slice=1 show=false");
	//run("Delete Slice");
	//run("Z Project...", "projection=[Average Intensity]");
	//titleZAvg=getTitle();
	//saveAs("Jpeg",directory + "\\" + titleZAvg);  //Save second z projection for reference, use for second alignment step
	//run("Concatenate...", "  title=[" + titleShort + "-reg2] image1=" + titleZAvg + " image2=" + titleReg1 + " image3=[-- None --]");
	//Run second alignment pass
	//run("Align slices in stack...", "method=5 windowsizex=" + width + " windowsizey=" + height + " x0=" + x + " y0=" + y + " swindow=0 subpixel=true itpmethod=1 ref.slice=1 show=false");
	//run("Delete Slice");
	//Crop final stack to remove edge effects due to aligning
	//brd = getString("Border size (pixels):", "5");
	//getDimensions(width, height, channels, slices, frames);
	//makeRectangle(brd, brd, width-(2*brd),height-(2*brd))
	//run("Crop");
	//Enhance lUTs
	//run("Enhance Contrast", "saturated=0.35");
	////Run z project one last time and save jpg
	//run("Z Project...", "projection=[Average Intensity]");
	//titleZAvg=getTitle();
	//saveAs("Jpeg",directory + "\\" + titleZAvg);  //Save final z projection for reference
	//run("Close"); //Close z porjection image
	////Save file
	//fileName = getTitle();
	//saveAs("tiff",directory + "\\" + fileName);
	////Close windows
	//while (nImages>0) { 
        //  selectImage(nImages); 
        //  close(); 
      } //
  	//selectWindow("Log"); 
   	//run("Close"); 
}

macro "Make substack [m]" {
	Dialog.create("Substack parameters...");
		Dialog.addMessage("Enter substack to extract:               ");
		//Dialog.addNumber("Box Width", 20);
		//Dialog.addNumber("Box Height", 20);
	    Dialog.addString("Substack: ", "-rois01",10);
		Dialog.show();
	//boxWidth = Dialog.getNumber();
	//boxHeight = Dialog.getNumber();
	substack = Dialog.getString();
	run("Make Substack...", "  slices=" + substack);
	//diagSaveZip = Dialog.getCheckbox();
}

macro "Dual-Grid...[d]"{
	path = File.openDialog("Select a file to generate grid ROIs on...");
	open(path);
	directory = File.getParent(path);
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","")
	print("\\Clear");
	print ("Image file name: "+titleOriginal);
	//Instructions
	title = "Instructions for makng grid of rois...";
	msg = "This macro will make a grid of rois from a selected area in you movie.\n \nMake a square selection (hold down shift) and click \"OK\" when ready. \n \nIf no selection is made, a grid for the entire are will be made. \n \nYou can set the parameters in the following window...";
	waitForUser(title,msg); 
	// Open dialogue window to set grid roi parameters
	Dialog.create("Create grid of ROIs...");
		Dialog.addMessage("Set grid parameters:               ");
		Dialog.addNumber("Box Width", 20);
		Dialog.addNumber("Box Height", 20);
	    Dialog.addString("Roi File Name Ext", "-rois01",10);
	    Dialog.addCheckbox("Save ROI zip?",true);
		Dialog.show();
	boxWidth = Dialog.getNumber();
	boxHeight = Dialog.getNumber();
	roiExt = Dialog.getString();
	diagSaveZip = Dialog.getCheckbox();
	roiName = titleShort+roiExt;
	print ("ROI file name: "+roiName);
	getBoundingRect(x, y, width, height)
	print("Original ROI Size: "+width+"x"+height);
	//Create grid
	spacing = 0;
	numRow = round(width/boxHeight);
	numCol = round(height/boxWidth);
	print("Grid Size: "+numRow+"x"+numCol);
	for(i = 0; i < numRow; i++)
	{
		for(j = 0; j < numCol; j++)
		{
			xOffset = j * (boxWidth + spacing);
			//print(xOffset);
			yOffset = i * (boxHeight + spacing);
			//print(yOffset);
			makeRectangle(x + xOffset, y + yOffset, boxWidth, boxHeight);
			roiManager("Add");
			//*if (roiManager("count") > 100)
			//	{
			//	print("Maximum reached: 100 entries have been created.");
			//	exit;
			//	}
		}		
	}
	//Save and export rois
	numROIs = roiManager("count");
	if (diagSaveZip == true) {
		roiManager("save", directory+"\\rois-"+d2s(boxWidth,0)+".zip");
		print(roiName+".zip with "+numROIs+" roi locations saved...");
	}
	// Save measurement results
	roiManager("multi measure");
	selectWindow("Results"); 
	saveName1 = directory+"\\"+roiName+"-Ch1-"+d2s(boxWidth,0)+".txt";
	saveAs("Results", directory+"\\ngrid"+d2s(boxWidth,0)+".txt");
	print(roiName+".txt with "+numROIs+" roi results saved...");
	// Close results window and remove existing rois
	selectWindow("Results"); 
	run("Close");
	newpath=replace(path,"Ch1","Ch2");
	open(newpath);
	directory2 = File.getParent(newpath);
	titleOriginal2 = getTitle();
	titleShort2 = replace (titleOriginal2, ".tif","");
	roiName2 = titleShort2+roiExt;
	roiManager("multi measure");
	selectWindow("Results"); 
	saveName2 = directory2+"\\" +roiName2+"-Ch2-"+d2s(boxWidth,0)+".txt";
	saveAs("Results", directory+"\\agrid"+d2s(boxWidth,0)+".txt");
	print(roiName+".txt with "+numROIs+" roi results saved...");
	// Close results window and remove existing rois
	selectWindow("Results"); 
	run("Close");
	roiManager("delete");
	run("Close");
	run("Close");
	//Run again
	}
}

macro "Adjust brightness and contrast [b]" {
	run("Brightness/Contrast...");
}
macro "ROI Grid...[7]"{
	//Get image properties
	fileName = getInfo("image.filename");
	imgName = replace(fileName, ".tif", "");
	fId = getImageID();
	fileDir = getInfo("image.directory");
	print("\\Clear");
	print ("Image file name: "+fileName);
	//Instructions
	title = "Instructions for makng grid of rois...";
	msg = "This macro will make a grid of rois from a selected area in you movie.\n \nMake a square selection (hold down shift) and click \"OK\" when ready. \n \nIf no selection is made, a grid for the entire are will be made. \n \nYou can set the parameters in the following window...";
	waitForUser(title,msg); 
	// Open dialogue window to set grid roi parameters
	Dialog.create("Create grid of ROIs...");
		Dialog.addMessage("Set grid parameters:               ");
		Dialog.addNumber("Box Width", 10);
		Dialog.addNumber("Box Height", 10);
	    Dialog.addString("Roi File Name Ext", "_rois01",10);
	    Dialog.addCheckbox("Save ROI zip?",true);
		Dialog.show();
	boxWidth = Dialog.getNumber();
	boxHeight = Dialog.getNumber();
	roiExt = Dialog.getString();
	diagSaveZip = Dialog.getCheckbox();
	roiName = imgName+roiExt;
	print ("ROI file name: "+roiName);
	getBoundingRect(x, y, width, height)
	print("Original ROI Size: "+width+"x"+height);
	//Create grid
	spacing = 0;
	numRow = round(width/boxHeight);
	numCol = round(height/boxWidth);
	print("Grid Size: "+numRow+"x"+numCol);
	for(i = 0; i < numRow; i++)
	{
		for(j = 0; j < numCol; j++)
		{
			xOffset = j * (boxWidth + spacing);
			//print(xOffset);
			yOffset = i * (boxHeight + spacing);
			//print(yOffset);
			makeRectangle(x + xOffset, y + yOffset, boxWidth, boxHeight);
			roiManager("Add");
			//*if (roiManager("count") > 100)
			//	{
			//	print("Maximum reached: 100 entries have been created.");
			//	exit;
			//	}
		}		
	}
	//Save and export rois
	numROIs = roiManager("count");
	if (diagSaveZip == true) {
		roiManager("save", fileDir+roiName+d2s(boxWidth,0)+".zip");
		print(roiName+".zip with "+numROIs+" roi locations saved...");
	}
	// Save measurement results
	roiManager("multi measure");
	selectWindow("Results"); 
	saveName = fileDir+roiName+d2s(boxWidth,0)+".txt";
	saveAs("Results", saveName);
	print(roiName+".txt with "+numROIs+" roi results saved...");
	// Close results window and remove existing rois
	selectWindow("Results"); 
	run("Close");
	roiManager("delete");
	//Run again
	msg = "Create another grid selection?";
	runAgain = getBoolean(msg);
	if (runAgain == true) {
		run("ROI Grid...[7]");
	}
}
macro "Piezo stack loader...[1]" {
	directory = getDirectory("");
	fileList = getFileList(directory);
	Dialog.create("Importing channel sequences...");
	Dialog.addCheckbox("Del original files?", true);
	Dialog.addCheckbox("Close file when done?", true);
    Dialog.addCheckbox("Create Avg Projection?", true);
    Dialog.addNumber("Number of z-planes: ", 4);
    Dialog.addCheckbox("Ch1", false);
	Dialog.addCheckbox("Ch2", true);
    Dialog.show();
    Diag_Ch1 = Dialog.getCheckbox();
	Diag_Ch2 = Dialog.getCheckbox();
    Diag_Ch3 = Dialog.getCheckbox();
    zPlanes = Dialog.getNumber();
    Diag_Ch4 = Dialog.getCheckbox();
    Diag_Ch5 = Dialog.getCheckbox();
	if (Diag_Ch4 == true) {
	//Run for Ch1...
		run("Image Sequence...", "open=&directory file=Ch1 sort");
		titleOriginal = getTitle();
		titleShort = replace (titleOriginal, ".tif","");
		Stack.getDimensions(width, height, channels, slices, frames)
		if (width!=height){
			run("Size...", "width="+width+" height="+width+" average interpolation=Bicubic");
		}
		imageName = getTitle();
		imageName = imageName + "-stack.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		
		// Create avg projection and save
		if (Diag_Ch3 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Enhance Contrast", "saturated=0.35");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch1.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		while (nImages>0) { 
		 	selectImage(nImages); 
		  	close();
		}
		open(directory+ "\\" +titleShort+"-stack.tif");
		Stack.getDimensions(width, height, channels, slices, frames);
		imgSlices=slices/zPlanes;
		print(width, height, channels, slices, frames);
		run("Stack to Hyperstack...", "order=xytcz channels=1 slices=" +imgSlices+" frames="+zPlanes+" display=Color");
		run("Stack Slicer", "split_timepoints stack_order=XYCZT");
		while (nImages>0) { 
		 	selectImage(nImages);
		 	imageName = getTitle();
			path = directory+imageName;
			save(path);
			print("Saved " + path);
			close();
		}
		//Close image windows
			if (Diag_Ch4 == true) {
				//run("Close");
				while (nImages>0) { 
	         	 selectImage(nImages); 
	          	close(); 
	      		}
			}
		// Delete origanl tif files
	    if (Diag_Ch3 == true) {
	        for (i=0; i < fileList.length; i++)
	            if (matches(fileList[i],".*tif.*")) {
	            fullfile = (directory + fileList[i]);
	            print("Deleting " + directory + fileList[i]);
	            deleting = File.delete(directory + fileList[i]);
	            }
	    }
	}
	if (Diag_Ch5 == true) {
		//Run for Ch2...
		run("Image Sequence...", "open=&directory file=Ch2 sort");
		titleOriginal = getTitle();
		titleShort = replace (titleOriginal, ".tif","");
		Stack.getDimensions(width, height, channels, slices, frames)
		if (width!=height){
			run("Size...", "width="+width+" height="+width+" average interpolation=Bicubic");
		}
		imageName = getTitle();
		imageName = imageName + "-stack.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch3 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Enhance Contrast", "saturated=0.35");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch1.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		while (nImages>0) { 
		 	selectImage(nImages); 
		  	close();
		}
		open(directory+ "\\" +titleShort+"-stack.tif");
		Stack.getDimensions(width, height, channels, slices, frames);
		imgSlices=slices/zPlanes;
		print(width, height, channels, slices, frames);
		run("Stack to Hyperstack...", "order=xytcz channels=1 slices=" +imgSlices+" frames="+zPlanes+" display=Color");
		run("Stack Slicer", "split_timepoints stack_order=XYCZT");
		
		while (nImages>0) { 
		 	selectImage(nImages);
		 	imageName = getTitle();
			path = directory+imageName;
			save(path);
			print("Saved " + path);
			close();
		}
		//Close image windows
			if (Diag_Ch4 == true) {
				//run("Close");
				while (nImages>0) { 
	         	 selectImage(nImages); 
	          	close(); 
	      		}
			}
		// Delete origanl tif files
	    if (Diag_Ch3 == true) {
	        for (i=0; i < fileList.length; i++)
	            if (matches(fileList[i],".*tif.*")) {
	            fullfile = (directory + fileList[i]);
	            print("Deleting " + directory + fileList[i]);
	            deleting = File.delete(directory + fileList[i]);
	            }
	    }
	}
}
macro "Image Sequence for two channels...[8]" {
	//Run Image sequence on a folder for Ch1 and Ch2. Saves .tif files with updated filename.
	directory = getDirectory("");
	fileList = getFileList(directory);
	Dialog.create("Importing channel sequences...");
	Dialog.addMessage("Select channels:               ");
	Dialog.addCheckbox("Ch1", false);
	Dialog.addCheckbox("Ch2", true);
    Dialog.addCheckbox("Del original files?", true);
    Dialog.addCheckbox("Close file when done?", true);
    Dialog.addCheckbox("Create Avg Projection?", true);
	Dialog.show();
	Diag_Ch1 = Dialog.getCheckbox();
	Diag_Ch2 = Dialog.getCheckbox();
    Diag_Ch3 = Dialog.getCheckbox();
    Diag_Ch4 = Dialog.getCheckbox();
    Diag_Ch5 = Dialog.getCheckbox();
	if (Diag_Ch1 == true) {
		//Run for Ch1...
		run("Image Sequence...", "open=&directory file=Ch1 sort");
		run("Enhance Contrast", "saturated=0.35");
		imageName = getTitle();
		imageName = imageName + "-Ch1.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch5 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Enhance Contrast", "saturated=0.35");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch1.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch4 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
	if (Diag_Ch2 == true) {
		//Run for Ch2...
		run("Image Sequence...", "open=&directory file=Ch2 sort");
		run("Enhance Contrast", "saturated=0.35");
		imageName = getTitle();
		imageName = imageName + "-Ch2.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch5 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Enhance Contrast", "saturated=0.35");
			titleZAvg=getTitle();
			titleZAvg = titleZAvg + "-Ch2.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch4 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
    // Delete origanl tif files
    if (Diag_Ch3 == true) {
        for (i=0; i < fileList.length; i++)
            if (matches(fileList[i],".*tif.*")) {
            fullfile = (directory + fileList[i]);
            print("Deleting " + directory + fileList[i]);
            deleting = File.delete(directory + fileList[i]);
            }
    }
}

macro "Z-Project [z]" {
	run("Z Project...", "projection=[Average Intensity]");
}
macro "Image Sequence for two confocal channels...[2]" {
	//Run Image sequence on a folder for Ch1 and Ch2. Saves .tif files with updated filename.
	directory = getDirectory("");
	fileList = getFileList(directory);
	Dialog.create("Importing channel sequences...");
	Dialog.addMessage("Select channels:               ");
	Dialog.addCheckbox("Ch1", true);
	Dialog.addCheckbox("Ch2", true);
	Dialog.addCheckbox("Ch3", true);
	Dialog.addCheckbox("Ch4", true);
    Dialog.addCheckbox("Del original files?", true);
    Dialog.addCheckbox("Close file when done?", true);
    Dialog.addCheckbox("Create Avg Projection?", true);
	Dialog.show();
	Diag_Ch1 = Dialog.getCheckbox();
	Diag_Ch2 = Dialog.getCheckbox();
    Diag_Ch3 = Dialog.getCheckbox();
    Diag_Ch4 = Dialog.getCheckbox();
    Diag_Ch5 = Dialog.getCheckbox();
    Diag_Ch6 = Dialog.getCheckbox();
    Diag_Ch7 = Dialog.getCheckbox();
	if (Diag_Ch1 == true) {
		//Run for Ch1...
		run("Image Sequence...", "open=&directory file=ch00 sort");
		run("Smooth", "stack");
		run("Flip Vertically", "stack");
		imageName = getTitle();
		imageName = imageName + "-Ch1.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch7 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Smooth");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch1.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch6 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
	if (Diag_Ch2 == true) {
		//Run for Ch2...
		run("Image Sequence...", "open=&directory file=ch01 sort");
		run("Smooth", "stack");
		run("Flip Vertically", "stack");
		imageName = getTitle();
		imageName = imageName + "-Ch2.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch7 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Smooth");
			titleZAvg=getTitle();
			titleZAvg = titleZAvg + "-Ch2.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch6 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
	if (Diag_Ch3 == true) {
		//Run for Ch1...
		run("Image Sequence...", "open=&directory file=ch02 sort");
		run("Smooth", "stack");
		run("Flip Vertically", "stack");
		imageName = getTitle();
		imageName = imageName + "-Ch3.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch7 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Smooth");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch3.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch6 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
	if (Diag_Ch4 == true) {
		//Run for Ch1...
		run("Image Sequence...", "open=&directory file=ch03 sort");
		run("Smooth", "stack");
		run("Flip Vertically", "stack");
		imageName = getTitle();
		imageName = imageName + "-Ch4.tif";
		path = directory+imageName;
		save(path);
		print("Saved " + path);
		// Create avg projection and save
		if (Diag_Ch7 == true) {
			run("Z Project...", "projection=[Average Intensity]");
			run("Smooth");
			titleZAvg = getTitle();
			titleZAvg = titleZAvg + "-Ch4.jpg";
			pathAvg = directory+titleZAvg;
			saveAs("Jpeg", pathAvg);
			print("Saved " + pathAvg);
		}
		//Close image windows
		if (Diag_Ch6 == true) {
			//run("Close");
			while (nImages>0) { 
         	 selectImage(nImages); 
          	close(); 
      		}
		}
		
	}
	 // Delete origanl tif files
    if (Diag_Ch5 == true) {
        for (i=0; i < fileList.length; i++)
            if (matches(fileList[i],".*tif.*")) {
            fullfile = (directory + fileList[i]);
            print("Deleting " + directory + fileList[i]);
            deleting = File.delete(directory + fileList[i]);
            }
    }
}
macro "Delete Laser Artifact...[5]" {
	for (i=1;i<=nSlices;i++) {
	setSlice(i);
	getStatistics(area,mean,min,max,std,histogram);
	if (mean>65) {
		run("Delete Slice");
		print(mean);
		i=i-1;
	}
}		
macro "Translate Across Channels...[4]" {
	for(i=0; i<nResults;i++) {
	x1 = getResult("dX",i);
	if (isNaN(x1)){
		x1=0;}
	y1 = getResult("dY",i);
	if (isNaN(y1)){
		y1=0;
	}
	slicenum = getResult("Slice",i);
	setSlice(slicenum-1); 
	run("Translate...", "x=x1 y=y1 interpolation=Bicubic slice"); 
	}
}
macro "Auto Template Registration on one channel and translate to the second...[9]" {
	// Macro to automate a double registration using Template Matching plugin.
	//Select directory containing original .tif files
	//directory = getDirectory("");
	//Select file to register - one channel at a time.
	path = File.openDialog("Select a file to register...");
	open(path);
	directory = File.getParent(path);
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","");
	// Generate z projection to use for alignment.
	run("Z Project...", "projection=[Average Intensity]");
	titleZAvg=getTitle();
	fullPath = directory + "\\" + titleOriginal;
	run("Concatenate...", "  title=[" + titleShort + "-reg] image1=" + titleZAvg + " image2=" + titleOriginal + " image3=[-- None --]");
	titleReg1=getTitle();
	//Select area for alignment template
	setTool("rectangle");
	waitForUser("Make selection...")
	Roi.getBounds(x, y, width, height);
	//Run alignment, first pass
	run("Align slices in stack...", "method=5 windowsizex=" + width + " windowsizey=" + height + " x0=" + x + " y0=" + y + " swindow=0 subpixel=true itpmethod=1 ref.slice=1 show=true");
	run("Delete Slice");
	run("Z Project...", "projection=[Average Intensity]");
	titleZAvg=getTitle();
	//saveAs("Jpeg",directory + "\\" + titleZAvg);  //Save second z projection for reference, use for second alignment step
	run("Concatenate...", "  title=[" + titleShort + "-reg2] image1=" + titleZAvg + " image2=" + titleReg1 + " image3=[-- None --]");
	resultspath=directory+"\\"+titleShort;
	saveAs("Results",resultspath+"results1.txt");
	selectWindow("Results");
	run("Close");
	//Run second alignment pass
	run("Align slices in stack...", "method=5 windowsizex=" + width + " windowsizey=" + height + " x0=" + x + " y0=" + y + " swindow=0 subpixel=true itpmethod=1 ref.slice=1 show=true");
	run("Delete Slice");
	saveAs("Results",resultspath+"results2.txt");
	selectWindow("Results");
	run("Close");
	//Crop final stack to remove edge effects due to aligning
	brd = 10;
	getDimensions(width, height, channels, slices, frames);
	makeRectangle(brd, brd, width-(2*brd),height-(2*brd))
	run("Crop");
	//Enhance lUTs
	run("Enhance Contrast", "saturated=0.35");
	//Run z project one last time and save jpg
	run("Z Project...", "projection=[Average Intensity]");
	titleZAvg=getTitle();
	saveAs("Jpeg",directory + "\\" + titleZAvg);  //Save final z projection for reference
	run("Close"); //Close z projection image
	//Save file
	fileName = getTitle();
	saveAs("tiff",directory + "\\" + fileName);
	run("Close");
   	newpath=replace(path,"Ch1","Ch2");
	open(newpath);
	directory = File.getParent(newpath);
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","");
	//Translate based on first channel alignment
	run("Results... ", "open="+resultspath+"results1.txt");
	for(i=0; i<nResults;i++) {
		x1 = getResult("dX",i);
			if (isNaN(x1)){
				x1=0;}
			y1 = getResult("dY",i);
			if (isNaN(y1)){
				y1=0;
			}
		slicenum = getResult("Slice",i);
		print (slicenum);
		setSlice(slicenum-1); 
		run("Translate...", "x=x1 y=y1 interpolation=Bicubic slice"); 
	}
	//Run second alignment pass
	run("Results... ", "open="+resultspath+"results2.txt");
	for(i=0; i<nResults;i++) {
		x1 = getResult("dX",i);
			if (isNaN(x1)){
				x1=0;}
			y1 = getResult("dY",i);
			if (isNaN(y1)){
				y1=0;
			}
		slicenum = getResult("Slice",i);
		print (slicenum);
		setSlice(slicenum-1); 
		run("Translate...", "x=x1 y=y1 interpolation=Bicubic slice"); 
	}
	//Crop final stack to remove edge effects due to aligning
	getDimensions(width, height, channels, slices, frames);
	makeRectangle(brd, brd, width-(2*brd),height-(2*brd))
	run("Crop");
	//Enhance lUTs
	run("Enhance Contrast", "saturated=0.35");
	//Run z project one last time and save jpg
	run("Z Project...", "projection=[Average Intensity]");
	titleZAvg=getTitle();
	ZAvgNewTitle=replace(titleZAvg,".tif","");
	saveAs("Jpeg",directory + "\\" + ZAvgNewTitle+"-reg2");  //Save final z projection for reference
	run("Close"); //Close z projection image
	//Save file
	fileName = getTitle();
	saveAs("tiff",directory + "\\" + titleShort+"-reg2");
	run("Close");
	//Close windows
	while (nImages>0) { 
          selectImage(nImages); 
          close(); 
    } 
  	selectWindow("Log"); 
   	run("Close"); 
}
macro "Resize stacks...[r]" {
	path = File.openDialog("Select a file to resize...");
	open(path);
	directory = File.getParent(path);
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","");
	fullPath = directory + "\\" + titleOriginal;
	resultspath=directory+"\\"+titleShort+"-sq";
	Stack.getDimensions(width, height, channels, slices, frames)
	if (width!=height){
		run("Size...", "width="+width+" height="+width+" average interpolation=Bicubic");
	}
	//saveAs("tiff",directory + "\\" + titleShort+"-sq");
	saveAs("tiff",directory + "\\" +titleShort);
	run("Close");
}

macro "Process pupil data...[p]"{
des = getDirectory("Choose Source Directory ");
Datadir=des +File.separator+"Data" +File.separator;
list = getFileList(Datadir);
print(list.length+ " Files");

for (i=0; i<list.length;i++) {
               
print("Reading "+Datadir+list[i]);
open (Datadir+list[i]);  //open image i
run("Enhance Contrast...", "saturated=0.4 normalize equalize process_all");
//makeRectangle(0, 18, 232, 240);
//run("Crop");
//run("Invert", "stack");
//run("Align slices in stack...", "method=5 windowsizex=180 windowsizey=120 x0=30 y0=25 swindow=0 subpixel=false itpmethod=0 ref.slice=1 show=true");
//run("Select All");
//run("Invert", "stack");

saveAs("Tiff",  des+File.separator+"edit"+File.separator+list[i]);
run("Close All");
}
print("All Done!");
}

macro "MicrogliaMotility...[3]" {
	//Processes microglia tif stack for motility analysis

	//Free ImageJ virtual memory
	IJ.freeMemory();

	if (isOpen("Log")){
    	selectWindow("Log"); 
    	run("Close");
	} 
	//Select microglia motility TIF file to analyze.
	path = File.openDialog("Select xyzt TIF stack to process...");
	open(path);
	directory = File.getParent(path);
	origFile = path;
	titleOriginal = getTitle();
	titleShort = replace (titleOriginal, ".tif","");
	//Specify which slices to include in z-projection
	waitForUser("Find beginning and end slices and click ok when ready");
	
	Dialog.create("Select slice range to z-project: ");
	Dialog.addNumber("Start slice: ", 1);
	Dialog.addNumber("End slice: ", 40);
	Dialog.addNumber("Number of timepoints: ",12);
	Dialog.show()
	
	sliceStart = Dialog.getNumber();
	sliceEnd = Dialog.getNumber();
	timeNumber = Dialog.getNumber();
	getDimensions(x,x,x,slices,x);

	slicesPerTime = slices/timeNumber;
	if (slices%timeNumber!=0){
		choice=getBoolean("Your slice number and timepoints don't add up!","Close and start over", "Stare at your desktop")
		if (choice==0 ||choice==1){
			exit("You chose poorly")
		}
	}
	
	//Set up analysis settings
	Dialog.create("Initializing parameters...");
	Dialog.addMessage("Select xyzt TIF stack:               ");
	Dialog.addCheckbox("Covert to 8 bit", true);
	Dialog.addCheckbox("Separate timepoints?",true);
	Dialog.addCheckbox("Smooth?", true);
	Dialog.addCheckbox("Save all timepoint stacks?",true);
	Dialog.addCheckbox("Save all max projections?", true);
    Dialog.addCheckbox("Delete original file?", false);
	Dialog.show();
	
	conv8flag = Dialog.getCheckbox();
	sepTimeFlag = Dialog.getCheckbox();
    smoothFlag = Dialog.getCheckbox();
    saveStacksFlag = Dialog.getCheckbox();
    saveMaxFlag = Dialog.getCheckbox();
    delOrigFlag = Dialog.getCheckbox();
    
    run("Grays");	
	if (conv8flag == true) {
		//Convert stack to 8-bit
		run("8-bit");
		run("Enhance Contrast", "saturated=0.35");
	}
	if (smoothFlag == true){
		run("Smooth", "stack");
	}
	if (sepTimeFlag == true){
		//Makes hyperstack and splits timepoints
		run("Stack to Hyperstack...", "order=xyztc channels=1 slices="+slicesPerTime+" frames="+timeNumber+" display=Color");
		run("Stack Slicer", "split_timepoints stack_order=XYZTC");
	}
	for (i=0; i<timeNumber;i++){
		name=getTitle();
		newTitle=replace(name,name,"-tStack");
		saveAs("tiff",directory + "\\" +titleShort+newTitle+timeNumber-i);
		close();
	}
	for (i=0;i<timeNumber;i++){
		open(directory+ "\\" +titleShort+newTitle+timeNumber-i+".tif");
		run("Z Project...","start="+sliceStart+" stop="+sliceEnd+" projection=[Average Intensity]");
		name=getTitle();
		newName=replace(name,name,"tSlice");
		saveAs("tiff",directory + "\\" + newName+timeNumber-i);
		close();
		close();
	}
	for (i=0;i<timeNumber;i++){
		open(directory+ "\\" +newName+(i+1)+".tif");
	}
	run("Images to Stack", "name=MaxStack-"+titleShort+" title=[] use");
	titleStackName=getTitle();
	run("Z Project...", "projection=[Average Intensity]");
	saveAs("tiff",directory+ "\\PreMaxAligned-"+titleShort);
	close();
	
	//titleZMax=getTitle();
	//run("Concatenate...", "  title=[" + titleShort + "-reg] image1=" + titleZMax + " image2=" + titleStackName + " image3=[-- None --]");
	
	//Select area for alignment template
	setTool("rectangle");
	waitForUser("Draw box around somas to align...");
	Roi.getBounds(x, y, width, height);
	
	titleShort = replace (titleShort, "-1.tif","");
	
	//Run alignment
	run("Align slices in stack...", "method=5 windowsizex=" + width + " windowsizey=" + height + " x0=" + x + " y0=" + y + " swindow=0 subpixel=true itpmethod=1 ref.slice=1 show=false");
	//run("Delete Slice");
	run("Z Project...", "projection=[Max Intensity]");
	saveAs("tiff",directory+ "\\PostMaxAligned-"+titleShort);
	close();
	titleShort = replace (titleShort, "-1.tif","");
	saveAs("tiff",directory+ "\\"+titleShort+"-timelapse");

	if (isOpen("Log")){
    	selectWindow("Log"); 
    	run("Close");
	}
	
    if (isOpen("Exception")){
    	selectWindow("Exception"); 
    	run("Close");
	}
    
    //selectWindow("Exception"); 
    //run("Close");
	 
   
	//Crop final stack to remove edge effects due to aligning
	waitForUser("Draw box to crop out black edges...");
	Roi.getBounds(x, y, width, height);
	makeRectangle(x,y,width,height);
	run("Crop");

	//Enhance lUTs
	run("Enhance Contrast", "saturated=0.35");
	
	if (isOpen("Exception")){
    	selectWindow("Exception"); 
    	run("Close");
	} 

	//Run z project one last time and save jpg
	run("Z Project...", "projection=[Max Intensity]");
	titleZAvg=getTitle();
	saveAs("Jpeg",directory + "\\" + titleZAvg);  //Save final z projection for reference
	run("Close"); //Close z projection image

	//Save files
	fileName = getTitle();
	saveAs("tiff",directory + "\\" + fileName);
	if (saveMaxFlag == 1){
		run("Stack to Images");
		for (i=0;i<timeNumber;i++){
			name=getTitle();
			save(directory+ "\\" +name);
			close();
		}
	} else{
		close();
	}

	// Delete timepoint z-stacks
    if (saveStacksFlag == false) {
        fileList = getFileList(directory);
        for (i=0; i < fileList.length; i++){
            if (matches(fileList[i],".*tStack.*")) {
	            fullfile = (directory + fileList[i]);
	            print("Deleting " + directory + fileList[i]);
	            deleting = File.delete(directory +"\\"+ fileList[i]);
            }
        }
    }
    
    // Delete original TIF file
    if (delOrigFlag == true){
    	File.delete(origFile);
    }

	if (isOpen("Log")){
    	selectWindow("Log"); 
    	run("Close");
	}

	waitForUser("Can't stop won't stop!","Analysis Complete!");
