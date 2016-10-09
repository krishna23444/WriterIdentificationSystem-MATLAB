# WRITER IDENTIFICATION SYSTEM


Handwriting recognition is one of the important areas in image processing.

Writer recognition proves to be more challenging because it involves identifying the

writer, independent of the text written by him / her. Handwriting styles like slant,

scale help to identify features that uniquely distinguish a writer. Text Independent

Handwriting Recognition is widely used in the field of forensic analysis and

document verification.

The Writer Identification System consists of training, enrollment and

identification stages. In all the stages, the handwritten document images are

segmented into word regions and Scale Invariant Feature Transform (SIFT) is

applied and descriptors are obtained. In the Training stage, Codebook is constructed

from the SIFT Descriptors(SD) of the training samples of different writers so that

the number of features that need to be considered can be reduced for identification.

In the Enrollment stage, the handwriting documents of different writers are given as

input and two features SD Signature (SDS) and Scale and Orientation

Histogram(SOH) are generated for each writer and stored as feature templates to be

used in the next stage. In the Identification Stage, the SDS of the given handwritten

document is generated using the Codebook and is compared with SDS present in the

feature templates and a distance measure is computed. Likewise, the SOH of the

given handwriting is generated, matched with those found in the feature templates

and a distance measure is computed. The two measures are used in the identification

of the writer.
