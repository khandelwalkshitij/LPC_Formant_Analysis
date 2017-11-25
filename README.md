# LPC_Formant_Analysis
Use of Linear Predictive Coding for Formant Analysis of Concurrent Vowels

The project focuses on understanding the effects of noise on the formant representations of both single and concurrent vowels. The dataset used for this purpose included values of single and concurrent vowels at two fundamental frequencies, 100 Hz and 126 Hz respectively. With the help of Linear Predictive Coding (LPC), the formant frequencies were first found for these vowels. Following this, using various speech signals, Speech Spectrum Shaped Noise was generated. After this, the noise was added to the vowels for 3 different SNR values. The formant frequencies were then again estimated for these corrupted signals having different SNR levels. An analysis has been carried out to investigate the effects of the different SNR levels on the formants. Further, an attempt has been made to understand which vowels (both single and concurrent) are more susceptible to noise.

# Authors

Taru Kapoor, Kshitij Khandelwal, Anubhav Sachan

# Introduction

The general character of the speech signal varies at the phoneme rate, which is on the order of 10 phonemes per second, while the detailed time variations of the speech waveform are at a much higher rate. That is, the changes in vocal tract configuration occur relatively slowly compared to the detailed time variation of the speech signal. The sounds created in the vocal tract are shaped in the frequency domain by the frequency response of the vocal tract. The resonance frequencies resulting from a particular configuration of the articulators are instrumental in forming the sound corresponding to a given phoneme. These resonance frequencies are called the formant frequencies of the sound. On analyzing the frequency spectrum of a speech signal, various peaks can be observed. The formant frequencies correspond to local maxima in the spectrum. To identify these formants, linear predictive coding proves extremely useful. On carrying out LPC analysis for a speech signal, a prediction polynomial _A(z)_ in _z^(-1)_ is obtained. In the pole-zero plot of _A(z)_, the zeros lying close to or on the unit circle correspond to the formant frequencies of the speech signal. Figure 1 shows the frequency spectrum of a speech signal along with the LPC spectrum of the signal. The peaks in the LPC spectrum correspond to the formant frequencies.

# References

[1] L.Rabiner and R.Schafer, Introduction to Digital Speech Processing. Hanover, Now Publishers, 2007.
[2] Shodhganga.inflibnet.ac.in, 2017. [Online]. Available: http://shodhganga.inflibnet.ac.in/bitstream/10603/50843/9/09_chapter%202.pdf [Accessed: 15- Nov- 2017]
[3] "Speech Spectrum Shaped Noise - File Exchange - MATLAB Central", In.mathworks.com, 2017. [Online]. Available: https://in.mathworks.com/matlabcentral/fileexchange/55701-speech-spectrum-shaped-noise [Accessed: 17- Nov- 2017]
[4] R. Snell and F. Milinazzo, "Formant location from LPC analysis data", IEEE Transactions on Speech and Audio Processing, vol. 1, no. 2, pp. 129-134, 1993.
[5] "NOIZEUS: Noisy speech corpus - Univ. Texas-Dallas", Ecs.utdallas.edu, 2017. [Online]. Available: http://ecs.utdallas.edu/loizou/speech/noizeus/ [Accessed: 17- Nov- 2017].
[6] T. Kapoor, K. Khandelwal and A. Sachan, "khandelwalkshitij/LPC_Formant_Analysis", GitHub, 2017. [Online]. Available: https://github.com/khandelwalkshitij/LPC_Formant_Analysis
[7] Catford, J.C. (1988) A Practical Introduction to Phonetics, Oxford University Press, p. 161. ISBN 978-0198242178
[8] Assmann, P. F. (1996). Modeling the perception of concurrent vowels: Role of formant transitions. The Journal of the Acoustical Society of America, 100(2, Pt 1), 1141-1152. [Online] http://dx.doi.org/10.1121/1.416299
[9] Cheveigné, A. (1997). Concurrent vowel identification. III. A neural model of harmonic interference cancellation. The Journal of the Acoustical Society of America, 101, 2857. [Online] https://doi.org/10.1121/1.419480
