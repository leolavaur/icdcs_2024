# FL x Security for Network Monitoring

This tutorial will be held at the [44th IEEE International Conference on Distributed Computing Systems]([https://nof.dnac.org](https://icdcs2024.icdcs.org/)) (ICDCS 2024) in July 2024.
This repository contains the materials, including the Jupyter notebooks and the presentations support, that have been used during the tutorial.
You can find a published summary of the tutorial content in the conference proceedings.

## Abstract

Learning (FL) is a Machine Learning paradigm that enables training models across distributed clients without accessing their data. In the context of network security, FL can be used to collaboratively train Intrusion Detection System (IDS) models across multiple organizations, virtually extending the local dataset of each participant.
Among the new challenges raised by this approach, the heterogeneity of the clients’ environments induce consequent differences in the data distributions, and therefore contributions.
Further, identifying and mitigating malicious contributions is made more complex in heterogeneous environments.

This tutorial introduces the audience to the principles of FL and its application to network security, and more specifically to build Collaborative Intrusion Detection Systems (CIDSs) using FL.
We address open challenges on that regard, before focusing on the problem of training on heterogeneous data.
Finally, we discuss the issues raised by using FL in the context of network security, with a particular focus on poisoning attacks.

## Speakers

### Yann Busnel

<p align="center">
    <img src="./img/yann.png" alt="Yann Busnel - NoF 2023" style="width: 50%; max-width: 200px;">
</p>

Yann Busnel has joined IMT Nord Europe as Dean of Research and Innovation from June 2023. After more than 15 years of experience as a faculty, including 6 years as a full professor at IMT Atlantique and member of the IRISA laboratory, he now oversees all research and innovation activities in line with Institut Mines-Télécom’s strategy. He contributes closely to the definition of strategic orientations and to the operational management of the institution. He also represents the Executive Board internally and externally with its partners in the research environment.

He holds an Habilitation to Supervise Research and a PhD respectively from the École Normale Supérieure de Rennes and the University of Rennes. After starting his career in Italy (La Sapienza Universita di Roma), he worked at the University of Nantes, then at ENSAI in Rennes, before joining IMT. As a professor at IMT, he was previously head of the Rennes campus of IMT Atlantique, in charge of education and research purposes.

His research topics are mainly related to Models for large-scale distributed systems and networks, with application in Data stream analysis, Cybersecurity, Massive health data and Artificial Intelligence. Recently, his areas of application range from (i) cybersecurity and dependability to (3) the analysis of medical data, in the context of pharmacovigilance or genomic sequence analysis, and (3) the self-organized coordination of fleets of drones. He is co-head of the national network of research on Distributed Systems and Networks (GDR RSD and GDR Security). He has published over 100 articles in peer-reviewed journals and conferences. He has also coordinated several national and international collaborative research projects.


### Léo Lavaur

<p align="center">
    <img src="./img/leo.png" alt="Leo Lavaur - NoF 2023" style="width: 50%; max-width: 200px;">
</p>

Léo Lavaur received the engineering degree in information security from the National Engineering School, South Brittany (ENSIBS), Vannes, France, in 2020. He is currently pursuing the Ph.D. degree in cybersecurity with the Engineering School, IMT Atlantique and the Chair on Cybersecurity in Critical Networked Infrastructures (Cyber CNI), Rennes, France. During his studies, he also worked in industry with Orange Cyberdefense as a part-time Employee for three years, where he worked on application security, and Wi-Fi rogue access-point detection and location.

He now studies the collaboration in security systems, and how to share data without compromising security. 
His current research focuses on the challenges of using federated learning as a framework for collaborative intrusion detection systems.
In particular, he works on the detections of malicious contributions in heterogeneous environments, as well as on the creation of datasets for evaluating FIDS in heterogeneous settings.

## Tutorial content

This tutorial is structured as an alternation between lectures and practical exercises. Lectures will take about 20 to 30 minutes each, with the exercises filling the rest. This program is divided in three parts:

1. fundamentals of FL,
2. FL for collaborative security,
3. security of FL architectures.

**Fundamentals of FL.** 
The first lecture introduces the audience to the core principles of FL with examples of applications.
In the hands-on, participants will be introduced to [Flower](https://flower.ai/), an open-source framework for FL in Python, and to existing datasets for FL.
The goal is to lay down the foundations for the rest of the tutorial.

**FL for collaborative security.**
The second lecture will focus on the application of FL to network security, and more specifically to the training of Collaborative Intrusion Detection Systems (CIDS) models.
This part will focus on the challenges raised by the heterogeneity of the clients' environments, and how to address them.
The hands-on will consist of building a simple CIDS model using Flower and a dataset of network traffic, and experiment some of these challenges with toy examples.

**Security in collaborative FL.** 
The last lecture will address some challenges of deploying and running Federated Intrusion Detection Systems (FIDSs).
Depending on the nature of the federation (public or private, trustworthiness of the participants, *etc.*), such systems can be vulnerable to various attacks.
In particular, we will focus on poisoning attacks, where a participant tries to degrade the global model by sending malicious contributions, before discussing possible countermeasures.
The hands-on will consist of simulating a poisoning attack on the CIDS model built in the previous part, and experimenting with strategies to detect and mitigate such attacks.

## Materials

### Repository structure

The repository is structured as follows:
```bash
.
```

### Installation

The project uses [Poetry](https://python-poetry.org) for Python dependencies management, and [Nix](https://nixos.org) for system dependencies management.

If you are a Nix user, the easiest way to install the dependencies is to use the provided `flake.nix` file, which will create a virtual environment with all the necessary dependencies, including the Python ones. To do so, simply run the following command from anywhere inside the repository, and open the Jupyter notebooks from the generated shell session.
```bash
nix develop
```

If you are not a Nix user, you can still use Poetry to install the Python dependencies. To do so, run the following command at the root of the respository.
```bash
poetry install
```
You can then use the genserated virtual environment to run the notebooks. If not, you can open a shell session using `poetry shell` and run `jupyter notebook` from there.



