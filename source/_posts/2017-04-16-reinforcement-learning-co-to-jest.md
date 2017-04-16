---
title: Reinforcement learning - co to jest?
date: 2017-04-16T22:40:00+01:00
categories:
    - Sutton & Barto
tags:
    - DSP2017
    - reinforcement-learning
image: reinforcement_learning_what_is_it.jpg
excerpt: Post w którym wyjaśniam co to jest reinforcement learning.
---
## Ogłoszenia parafialne
Od jakiegoś czasu staram się czytać powoli książkę ["Reinforcement Learning: An Introduction"](http://incompleteideas.net/sutton/book/the-book-2nd.html) autorstwa Richarda S. Suttona i Andrew G. Barto. Ktoś pod jednym z postów prosił o jakieś dobre materiały z RL, więc podaję i polecam tę książkę. Jest to ponoć klasyczna pozycja z tej dziedziny. Moim zdaniem zasługuje na to miano, o ile można tak stwierdzić po przeczytaniu niespełna dwóch rozdziałów tej książki.

Dla utrwalenia wiedzy, postanowiłem pisać kod do algorytmów występujących w tej książce. Są co prawda przykładowe kody na zalinkowanej powyżej stronie, ale nie zamierzam z nich korzystać (może jak się kompletnie zatnę na czymś). Repozytorium (na razie puste): [dloranc/reinforcement-learning-an-introduction](https://github.com/dloranc/reinforcement-learning-an-introduction).

## Reinforcement Learning - co to jest?
Reinforcement Learning (uczenie ze wzmacnianiem) jest to pewien sposób rozwiązywania niektórych problemów, których nie da się w prosty sposób rozwiązać (analitycznie) albo nie mamy dobrego modelu. Coś, będziemy nazywać to **agentem**, wykonuje pewne **akcje** w pewnym nieznanym **środowisku**, które znajduje się w określonym **stanie**. Za podejmowanie akcji agent otrzymuje sygnał wzmocnienia. Może on być pozytywny (**nagroda**) albo negatywny (**kara**). Agent podejmując interakcje ze środowiskiem uczy się pewnej **polityki**. Celem reinforcement learningu jest wyznaczenie optymalnej **polityki** dla której dostaniemy jak najwięcej nagród.

![Reinforcement learning - schemat](/images/posts/reinforcement_learning_what_is_it/01.png "Reinforcement learning - schemat")

Jest to sposób uczenia inspirowany osiągnieciami [psychologii behawioralnej](https://pl.wikipedia.org/wiki/Wzmocnienie_(behawioryzm)). Uczymy się świata przecież w ten sposób. Wyobraźmy sobie na przykład małe dziecko, które uczy się chodzić. Próbując się nauczyć tego zadania wykonuje rozmaite akcje metodą prób i błędów. Dzięki zmysłom otrzymuje pewne bodźce ze świata i podejmuje w zależności od nich pewne akcje. Jeśli nie wywali się na twarz, to dobre akcje, które były udane będą przez nie wykonywane częściej i coraz lepiej (wzmocnienie pozytywne). Jeśli zaliczy podłogę, to następnym razem będzie się starało nie podejmować działań skutkującym takim rezultatem. I tak, aż nauczy się chodzić.

W tabeli poniżej przedstawiłem przykłady rozmaitych agentów, środowisk itd. itp.:

| Agent           | Środowisko | Stan                                               | Akcje                           | Szukana polityka               |
| --------------- | ---------- | -------------------------------------------------- | ------------------------------- | ------------------------------ |
| dziecko         | świat      | stan świata, pozycja w której znajduje się dziecko | ruchy kończynami                | nauczenie się chodzić          |
| robot           | zakład     | dane z czujników, pozycja manipulatorów            | ruch manipulatorami             | sortowanie przedmiotów         |
| bot do gry w Go | plansza    | aktualna pozycja na planszy                        | postawienie kamienia na planszy | wygrywająca jak najwięcej gier |

Ale kij tam tabelki, zobaczmy to na rzeczywistych projektach. Poniżej dałem playlistę z różnymi fajnymi przykładami:

<div class="video-container"><iframe width="900" height="600" src="https://www.youtube.com/embed/SH3bADiB7uQ?list=PL5nBAYUyJTrM48dViibyi68urttMlUv7e" frameborder="0" allowfullscreen></iframe></div>

Dla mnie szczególnie uroczy jest ten robot podrzucający naleśniki:

<div class="video-container"><iframe width="900" height="600" src="https://www.youtube.com/embed/W_gxLKSsSIE" frameborder="0" allowfullscreen></iframe></div>

## Czym się różni reinforcement learning od innych metod?

Jaka jest na przykład różnica między supervised learningiem a reinforcement learningiem? W supervised learningu dostajemy pewne dane i są one już wstępnie sklasyfikowane. Na ich podstawie algorytm musi się nauczyć jak je odróżniać (klasyfikować) albo jak przewidzieć pewną wartość na podstawie (regresja). W reinforcement learningu nie mamy nic na dzień dobry. Musimy znaleźć rozwiązanie bazując na wykonywaniu akcji w środowisku i na nagrodach/karach. Do tego jeszcze dochodzi problem eksploracji i wykorzystywania wiedzy zdobytej przez interakcję ze środowiskiem. W innych paradygmatach machine learningu to nie występuje. W unsupervised learningu jest podobnie, dostajemy jakieś dane i musimy je jakoś sklasyfikować. Nie kierujemy się jednak nagrodami/karami lecz ich strukturą.

## Podsumowanie
Na razie tyle, w następnym poście napiszę trochę o problemie zwanym jako **multi-armed bandit**.