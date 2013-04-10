/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	config.language = 'es';
	// config.uiColor = '#AADC6E';
	//config.toolbar = 'Full';

	config.toolbar_Full = [
		{ name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
		{ name: 'editing', items : [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },		
		{ name: 'links', items : [ 'Link','Unlink','Anchor' ] },
		{ name: 'insert', items : [ 'Image', 'SpecialChar' ] },
		{ name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
		{ name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote',
		'-','JustifyLeft','JustifyCenter','JustifyRight' ] },
		{ name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
		{ name: 'colors', items : [ 'TextColor','BGColor' ] },
	];

};
