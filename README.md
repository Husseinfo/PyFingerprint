## PyFingerprint

![GitHub](https://img.shields.io/github/license/hcji/PyFingerprint)
![GitHub release (latest by date including pre-releases)](https://img.shields.io/github/v/release/hcji/PyFingerprint?include_prereleases)
![GitHub repo size](https://img.shields.io/github/repo-size/hcji/PyFingerprint)


There are many types of chemical fingerprint for describing the molecule provided by different tools, such as RDKit, CDK and OpenBabel. This package aims to summarize them all.

### Dependencies

 1. [Anaconda](https://www.anaconda.com/products/individual) 
 2. [Java SE Development Kit 11](https://www.oracle.com/java/technologies/java-se-development-kit11-downloads.html) 
 3. [molvecgen](https://github.com/EBjerrum/molvecgen)
 
        pip install git+https://github.com/EBjerrum/molvecgen	
 4. [OpenBabel](http://openbabel.org/wiki/Main_Page)
 
		conda install -c conda-forge/label/main openbabel
 
### Install
#### Full installation
- Clone the repo and navigate to it.
- Create a predefined Python conda environment by `conda env create -f env/ddc_env.yml`. This ensures that you have the correct version of `rdKit` and `cudatoolkit`.
- Run `pip install .` to install remaining dependencies and add the package to the Python path.

#### Simple installation
If you do not use heteroencoder
    
    pip install git+https://github.com/hcji/PyFingerprint.git

### Usage
#### Fingerprints for single molecule

    import numpy as np
    from PyFingerprint.fingerprint import get_fingerprint, get_fingerprints

    cdktypes = ['standard', 'extended', 'graph', 'maccs', 'pubchem', 'estate', 'hybridization', 'lingo', 
                'klekota-roth', 'shortestpath', 'signature', 'substructure']
    rdktypes = ['rdkit', 'morgan', 'rdk-maccs', 'topological-torsion', 'avalon', 'atom-pair']
    babeltypes = ['fp2', 'fp3', 'fp4']
    vectypes = ['mol2vec', 'heteroencoder']

    smi = 'CCCCN'
    output = {}
    for f in cdktypes:
        output[f] = get_fingerprint(smi, f)

    for f in rdktypes:
        output[f] = get_fingerprint(smi, f)
        
    for f in babeltypes:
        output[f] = get_fingerprint(smi, f)
        
    for f in vectypes:
        output[f] = get_fingerprint(smi, f)

    output_np = output.copy()
    for k, fp in output.items():
        output_np[k] = fp.to_numpy()
        
#### Fingerprints for multi molecules

    smlist = ['CCCCC', 'CCCCN', 'CCCCO']    
    output = {}
    for f in cdktypes:
        output[f] = get_fingerprints(smlist, f)

    for f in rdktypes:
        output[f] = get_fingerprints(smlist, f)
        
    for f in babeltypes:
        output[f] = get_fingerprints(smlist, f)
        
    for f in vectypes:
        output[f] = get_fingerprints(smlist, f)

    output_np = output.copy()
    for k, fps in output.items():
        output_np[k] = np.array([fp.to_numpy() for fp in fps])
	
### Cite

```bibtex
@article{doi:10.1021/acs.analchem.0c01450,
author = {Ji, Hongchao and Deng, Hanzi and Lu, Hongmei and Zhang, Zhimin},
title = {Predicting a Molecular Fingerprint from an Electron Ionization Mass Spectrum with Deep Neural Networks},
journal = {Analytical Chemistry},
volume = {92},
number = {13},
pages = {8649-8653},
year = {2020},
doi = {10.1021/acs.analchem.0c01450},
    note ={PMID: 32584545},
URL = { 
        https://doi.org/10.1021/acs.analchem.0c01450
    
}}
```

### Support fingerprint types:

	**standard**: Considers paths of a given length. These are hashed fingerprints, with a default length of 1024.
	**extended**: Similar to the standard type, but takes rings and atomic properties into account into account.
	**graph**: Similar to the standard type by simply considers connectivity.
	**hybridization**: Similar to the standard type, but only consider hybridization state.
	**estate**: 79 bit fingerprints corresponding to the E-State atom types described by Hall and Kier.
	**pubchem**: 881 bit fingerprints defined by PubChem.
	**klekota-roth**: 4860 bit fingerprint defined by Klekota and Roth.
	**shortestpath**: A fingerprint based on the shortest paths between pairs of atoms and takes into account ring systems, charges etc.
	**signature**: A feature,count type of fingerprint, similar in nature to circular fingerprints, but based on the signature descriptor.
	**circular**: An implementation of the ECFP6 fingerprint.
	**lingo**: An implementation of the LINGO fingerprint.
	**rdkit**: Another implementation of a Daylight-like fingerprint by RDKit.
	**maccs**: The popular 166 bit MACCS keys described by MDL.
	**avalon**: Substructure or similarity Avalon fingerprint.
	**atom-pair**: RDKit Atom-Pair fingerprint.
	**topological-torsion**: RDKit Topological-Torsion Fingerprint.
	**morgan**: RDKit Morgan fingerprint.
	**fp2**: OpenBabel FP2 fingerprint, which indexes small molecule fragments based on linear segments of up to 7 atoms in length.
	**fp3**: OpenBabel FP3 fingerprint, which is a fingerprint method created from a set of SMARTS patterns defining functional groups.
	**fp4**: OpenBabel FP4 fingerprint, which is a fingerprint method created from a set of SMARTS patterns defining functional groups.
	**mol2vec**: Unsupervised machine learning approach for mulecule representation.  
	**heteroencoder**: Molecular descriptor generated from the hetero-encoder.

WeChat public account: Chemocoder    
<img align="center" src="https://github.com/hcji/hcji/blob/main/img/qrcode.jpg" width="20%"/>
