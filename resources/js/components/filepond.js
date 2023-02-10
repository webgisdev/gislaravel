import * as FilePond from "filepond";

window.FilePond = FilePond;

import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
window.FilePond.registerPlugin(FilePondPluginFileValidateType);

import FilePondPluginFileValidateSize from "filepond-plugin-file-validate-size";
window.FilePond.registerPlugin(FilePondPluginFileValidateSize);

import FilePondPluginImagePreview from "filepond-plugin-image-preview";
window.FilePond.registerPlugin(FilePondPluginImagePreview);
import "filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css";
