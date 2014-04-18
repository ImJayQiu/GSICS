// =================================== //
// Link Box                            //
// v1.0 - Feb 19, 2005                 //
// ----------------------------------- //
// Created by Lloyd Hassell            //
// Website: lloydhassell.brinkster.net //
// Email: lloydhassell@hotmail.com     //
// =================================== //

// INITIALIZATION:

linkBox = new Object();

// CONFIGURATION:

linkBox.bgColor = '#FFFFCC';
linkBox.borderColor = '#000000';
linkBox.borderWidth = 1;
linkBox.fontColor = '#000000';
linkBox.fontFace = 'verdana,arial';
linkBox.fontSize = 1;
linkBox.boxWidth = 200;
linkBox.boxPadding = 3;
linkBox.shadowVisible = true;
linkBox.shadowColor = '#999999';
linkBox.trackMouse = true;

linkBox.cursorOffsetX = 20;
linkBox.cursorOffsetY = 0;
linkBox.dropShadowOffsetX = 2;
linkBox.dropShadowOffsetY = 2;
linkBox.windowPadding = 2;
linkBox.openDelay = 350;

// MAIN:

linkBox.documentLoaded = false;
linkBox.boxLoaded = false;
linkBox.boxActive = false;
linkBox.openTimeout = null;
linkBox.trackMouseTimeout = null;

function documentLoaded() {
   linkBox.documentLoaded = true;
   }

function loadLinkBox() {
   if (!linkBox.boxLoaded) {
      captureCursor();
      linkBox.shadowLayerObj = addLayer('shadowBoxLayer');
      setLayerOnTop(linkBox.shadowLayerObj);
      linkBox.boxLayerObj = addLayer('linkBoxLayer');
      setLayerOnTop(linkBox.boxLayerObj);
      linkBox.boxLoaded = true;
      }
   }

function openLinkBox(MESSAGE,BGCOLOR,BORDERCOLOR,BORDERWIDTH,FONTCOLOR,FONTFACE,FONTSIZE,BOXWIDTH,BOXPADDING,SHADOWVISIBLE,SHADOWCOLOR,TRACKMOUSE) {
   if (dyn && linkBox.documentLoaded) {
      if (!linkBox.boxLoaded) loadLinkBox();
      if (linkBox.boxActive) hideLayer(linkBox.layerObj);
      var bgColor = (!isBlank(BGCOLOR)) ? BGCOLOR : linkBox.bgColor;
      var borderColor = (!isBlank(BORDERCOLOR)) ? BORDERCOLOR : linkBox.borderColor;
      var borderWidth = (!isBlank(BORDERWIDTH)) ? BORDERWIDTH : linkBox.borderWidth;
      var fontColor = (!isBlank(FONTCOLOR)) ? FONTCOLOR : linkBox.fontColor;
      var fontFace = (!isBlank(FONTFACE)) ? FONTFACE : linkBox.fontFace;
      var fontSize = (!isBlank(FONTSIZE)) ? FONTSIZE : linkBox.fontSize;
      var boxWidth = (!isBlank(BOXWIDTH)) ? BOXWIDTH : linkBox.boxWidth;
      var boxPadding = (!isBlank(BOXPADDING)) ? BOXPADDING : linkBox.boxPadding;
      linkBox.dropShadow = (!isBlank(SHADOWVISIBLE)) ? SHADOWVISIBLE : linkBox.shadowVisible;
      var shadowColor = (!isBlank(SHADOWCOLOR)) ? SHADOWCOLOR : linkBox.shadowColor;
      linkBox.mouseTracking = (!isBlank(TRACKMOUSE)) ? TRACKMOUSE : linkBox.trackMouse;
      var htmlStr = getTableTag(0,0,0,boxWidth) + '<tr>';
      htmlStr += getTdTag('left','top','',borderColor);
      htmlStr += getTableTag(boxPadding,borderWidth,0,'100%') + '<tr>';
      htmlStr += getTdTag('left','top','',bgColor);
      htmlStr += getFontTag(fontColor,fontFace,fontSize);
      htmlStr += MESSAGE;
      htmlStr += '</font></td></tr></table></td></tr></table>';
      setLayerHTML(linkBox.boxLayerObj,htmlStr);
      setLayerSize(linkBox.boxLayerObj,boxWidth,'');
      if (linkBox.dropShadow) {
         var htmlStr = getTableTag(0,0,0,boxWidth) + '<tr>';
         htmlStr += getTdTag('left','top','',shadowColor);
         htmlStr += getTableTag(boxPadding,borderWidth,0,'100%') + '<tr>';
         htmlStr += getTdTag('left','top','',shadowColor);
         htmlStr += getFontTag(shadowColor,fontFace,fontSize);
         htmlStr += MESSAGE;
         htmlStr += '</font></td></tr></table></td></tr></table>';
         setLayerHTML(linkBox.shadowLayerObj,htmlStr);
         setLayerSize(linkBox.shadowLayerObj,boxWidth,'');
         }
      linkBox.layerWidth = getLayerWidth(linkBox.boxLayerObj);
      linkBox.winWidth = getWinWidth();
      linkBox.winHeight = getWinHeight();
      linkBox.openTimeout = window.setTimeout('displayLinkBox()',linkBox.openDelay);
      }
   }

function closeLinkBox() {
   if (dyn && linkBox.boxLoaded) {
      linkBox.boxActive = false;
      window.clearTimeout(linkBox.openTimeout);
      hideLayer(linkBox.shadowLayerObj);
      hideLayer(linkBox.boxLayerObj);
      }
   }

function displayLinkBox() {
   if (linkBox.dropShadow) showLayer(linkBox.shadowLayerObj);
   showLayer(linkBox.boxLayerObj);
   linkBox.boxActive = true;
   updateLinkBoxPos();
   }

function updateLinkBoxPos() {
   if (linkBox.boxActive) {
      var posX = cursorWinX + linkBox.cursorOffsetX;
      if (posX + linkBox.layerWidth > linkBox.winWidth - linkBox.windowPadding) posX = cursorWinX - linkBox.layerWidth - linkBox.cursorOffsetX;
      if (posX < linkBox.windowPadding) posX = linkBox.windowPadding;
      posX += getDocScrollLeft();
      posY = cursorWinY + linkBox.cursorOffsetY + getDocScrollTop();
      if (linkBox.dropShadow) moveLayerTo(linkBox.shadowLayerObj,posX + linkBox.dropShadowOffsetX,posY + linkBox.dropShadowOffsetY);
      moveLayerTo(linkBox.boxLayerObj,posX,posY);
      if (linkBox.mouseTracking) linkBox.trackMouseTimeout = window.setTimeout('updateLinkBoxPos()',50);
      }
   }

window.onload = documentLoaded;