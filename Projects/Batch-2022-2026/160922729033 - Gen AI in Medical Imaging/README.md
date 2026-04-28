# Enhancing Diagnostic Accuracy through Generative AI and Synthetic Data Generation for Robust Medical Imaging

## 📖 Overview
This project explores the use of **Generative AI (GenAI)** to produce high-fidelity synthetic medical images.

<img src="https://codewave.com/insights/wp-content/uploads/2025/05/Role-of-AI-for-Medical-Imaging-Developing-a-Software.png" />

---

## 🧾 Project Description
Medical imaging models often suffer from performance degradation due to limited, imbalanced, or privacy-restricted datasets.
By augmenting real-world data with synthetic samples, we aim to improve the robustness and diagnostic accuracy of classification and segmentation models.
The model is trained, tested, and optimized using **feature scaling and hyperparameter tuning**, achieving high accuracy and demonstrating the practical use of AI in healthcare.

Robustness Testing: Evaluating how synthetic data helps models generalize better to "out-of-distribution" clinical scenarios.
Privacy Preservation: Demonstrating a pipeline where synthetic data can be shared without compromising sensitive patient information.


---

## 🎯 Objectives
- Data Synthesis: Leveraging architectures like GANs (Generative Adversarial Networks)
- Diffusion Models to create realistic medical scans (e.g., X-ray, MRI, or CT). 

---

## 📊 Dataset
- MedSAM  
- Source: `(https://www.synapse.org/Synapse:syn51156910/wiki/622351)`  

---

## ⚙️ Tech Stack
- Language: Python 3.x
- Deep Learning Frameworks: PyTorch / TensorFlow
- Generative Models: StyleGAN2-ADA, DDPM (Denoising Diffusion Probabilistic Models), or CycleGAN (for image-to-image translation).
- Libraries: NumPy, Pandas, Scikit-learn, OpenCV, Matplotlib.
- Evaluation Metrics: Fréchet Inception Distance (FID), Structural Similarity Index (SSIM), and Peak Signal-to-Noise Ratio (PSNR).
 

---

## 🤖 Model
- Algorithm: **Segment Anything Model (SAM)**  
- Accuracy: **~99% (after optimization)**  

---

## 🏫 Academic Details

| Field | Details |
|------|--------|
| Project Type | Major Project |
| Institution | Lords Institute of Engineering & Technology (LIET) |
| Department | AI&ML |
| Domain | Machine Learning |

---

## 👥 Team Members

| S.No | Name | Roll Number |
|-----|------|------------|
| 1 | Mohd Ismail Iqbal | 160922729017 |
| 2 | Syed Muqeet Ahmed | 160922729033 |
| 3 | Syed Nouman Ali | 160922729047 |

---

## 🚀 Run Project
```
git clone <(https://github.com/muqxt/B.E-Major-Project)>
cd project-folder
pip install -r requirements.txt
python main.py
```
