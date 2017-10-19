-- ==============================================================
-- File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2017.1
-- Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
-- 
-- ==============================================================

library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity Park_Inverse_sin_cud_rom is 
    generic(
             dwidth     : integer := 16; 
             awidth     : integer := 10; 
             mem_size    : integer := 1000
    ); 
    port (
          addr0      : in std_logic_vector(awidth-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(dwidth-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of Park_Inverse_sin_cud_rom is 

signal addr0_tmp : std_logic_vector(awidth-1 downto 0); 
type mem_array is array (0 to mem_size-1) of std_logic_vector (dwidth-1 downto 0); 
signal mem : mem_array := (
    0 => "0000000000000000", 1 => "0000000110011100", 2 => "0000001100110111", 
    3 => "0000010011010011", 4 => "0000011001101110", 5 => "0000100000001001", 
    6 => "0000100110100100", 7 => "0000101100111111", 8 => "0000110011011001", 
    9 => "0000111001110010", 10 => "0001000000001011", 11 => "0001000110100011", 
    12 => "0001001100111010", 13 => "0001010011010001", 14 => "0001011001100111", 
    15 => "0001011111111100", 16 => "0001100110010000", 17 => "0001101100100011", 
    18 => "0001110010110101", 19 => "0001111001000101", 20 => "0001111111010101", 
    21 => "0010000101100011", 22 => "0010001011110000", 23 => "0010010001111011", 
    24 => "0010011000000101", 25 => "0010011110001110", 26 => "0010100100010100", 
    27 => "0010101010011001", 28 => "0010110000011101", 29 => "0010110110011111", 
    30 => "0010111100011110", 31 => "0011000010011100", 32 => "0011001000011000", 
    33 => "0011001110010010", 34 => "0011010100001010", 35 => "0011011010000000", 
    36 => "0011011111110011", 37 => "0011100101100100", 38 => "0011101011010011", 
    39 => "0011110001000000", 40 => "0011110110101010", 41 => "0011111100010001", 
    42 => "0100000001110110", 43 => "0100000111011001", 44 => "0100001100111000", 
    45 => "0100010010010101", 46 => "0100010111110000", 47 => "0100011101000111", 
    48 => "0100100010011100", 49 => "0100100111101101", 50 => "0100101100111100", 
    51 => "0100110010001000", 52 => "0100110111010000", 53 => "0100111100010101", 
    54 => "0101000001011000", 55 => "0101000110010110", 56 => "0101001011010010", 
    57 => "0101010000001010", 58 => "0101010100111111", 59 => "0101011001110001", 
    60 => "0101011110011111", 61 => "0101100011001001", 62 => "0101100111110000", 
    63 => "0101101100010011", 64 => "0101110000110010", 65 => "0101110101001110", 
    66 => "0101111001100110", 67 => "0101111101111010", 68 => "0110000010001011", 
    69 => "0110000110010111", 70 => "0110001010011111", 71 => "0110001110100100", 
    72 => "0110010010100100", 73 => "0110010110100001", 74 => "0110011010011001", 
    75 => "0110011110001101", 76 => "0110100001111101", 77 => "0110100101101001", 
    78 => "0110101001010000", 79 => "0110101100110011", 80 => "0110110000010010", 
    81 => "0110110011101101", 82 => "0110110111000011", 83 => "0110111010010100", 
    84 => "0110111101100001", 85 => "0111000000101010", 86 => "0111000011101110", 
    87 => "0111000110101110", 88 => "0111001001101001", 89 => "0111001100011111", 
    90 => "0111001111010000", 91 => "0111010001111101", 92 => "0111010100100110", 
    93 => "0111010111001001", 94 => "0111011001101000", 95 => "0111011100000010", 
    96 => "0111011110010111", 97 => "0111100000100111", 98 => "0111100010110011", 
    99 => "0111100100111010", 100 => "0111100110111011", 101 => "0111101000111000", 
    102 => "0111101010110000", 103 => "0111101100100011", 104 => "0111101110010001", 
    105 => "0111101111111010", 106 => "0111110001011101", 107 => "0111110010111100", 
    108 => "0111110100010110", 109 => "0111110101101011", 110 => "0111110110111011", 
    111 => "0111111000000101", 112 => "0111111001001011", 113 => "0111111010001011", 
    114 => "0111111011000110", 115 => "0111111011111101", 116 => "0111111100101110", 
    117 => "0111111101011010", 118 => "0111111110000000", 119 => "0111111110100010", 
    120 => "0111111110111110", 121 => "0111111111010110", 122 => "0111111111101000", 
    123 => "0111111111110101", 124 => "0111111111111100", 125 => "0111111111111111", 
    126 => "0111111111111100", 127 => "0111111111110101", 128 => "0111111111101000", 
    129 => "0111111111010110", 130 => "0111111110111110", 131 => "0111111110100010", 
    132 => "0111111110000000", 133 => "0111111101011010", 134 => "0111111100101110", 
    135 => "0111111011111101", 136 => "0111111011000110", 137 => "0111111010001011", 
    138 => "0111111001001011", 139 => "0111111000000101", 140 => "0111110110111011", 
    141 => "0111110101101011", 142 => "0111110100010110", 143 => "0111110010111100", 
    144 => "0111110001011101", 145 => "0111101111111010", 146 => "0111101110010001", 
    147 => "0111101100100011", 148 => "0111101010110000", 149 => "0111101000111000", 
    150 => "0111100110111011", 151 => "0111100100111010", 152 => "0111100010110011", 
    153 => "0111100000100111", 154 => "0111011110010111", 155 => "0111011100000010", 
    156 => "0111011001101000", 157 => "0111010111001001", 158 => "0111010100100110", 
    159 => "0111010001111101", 160 => "0111001111010000", 161 => "0111001100011111", 
    162 => "0111001001101001", 163 => "0111000110101110", 164 => "0111000011101110", 
    165 => "0111000000101010", 166 => "0110111101100001", 167 => "0110111010010100", 
    168 => "0110110111000011", 169 => "0110110011101101", 170 => "0110110000010010", 
    171 => "0110101100110011", 172 => "0110101001010000", 173 => "0110100101101001", 
    174 => "0110100001111101", 175 => "0110011110001101", 176 => "0110011010011001", 
    177 => "0110010110100001", 178 => "0110010010100100", 179 => "0110001110100100", 
    180 => "0110001010011111", 181 => "0110000110010111", 182 => "0110000010001011", 
    183 => "0101111101111010", 184 => "0101111001100110", 185 => "0101110101001110", 
    186 => "0101110000110010", 187 => "0101101100010011", 188 => "0101100111110000", 
    189 => "0101100011001001", 190 => "0101011110011111", 191 => "0101011001110001", 
    192 => "0101010100111111", 193 => "0101010000001010", 194 => "0101001011010010", 
    195 => "0101000110010110", 196 => "0101000001011000", 197 => "0100111100010101", 
    198 => "0100110111010000", 199 => "0100110010001000", 200 => "0100101100111100", 
    201 => "0100100111101101", 202 => "0100100010011100", 203 => "0100011101000111", 
    204 => "0100010111110000", 205 => "0100010010010101", 206 => "0100001100111000", 
    207 => "0100000111011001", 208 => "0100000001110110", 209 => "0011111100010001", 
    210 => "0011110110101010", 211 => "0011110001000000", 212 => "0011101011010011", 
    213 => "0011100101100100", 214 => "0011011111110011", 215 => "0011011010000000", 
    216 => "0011010100001010", 217 => "0011001110010010", 218 => "0011001000011000", 
    219 => "0011000010011100", 220 => "0010111100011110", 221 => "0010110110011111", 
    222 => "0010110000011101", 223 => "0010101010011001", 224 => "0010100100010100", 
    225 => "0010011110001110", 226 => "0010011000000101", 227 => "0010010001111011", 
    228 => "0010001011110000", 229 => "0010000101100011", 230 => "0001111111010101", 
    231 => "0001111001000101", 232 => "0001110010110101", 233 => "0001101100100011", 
    234 => "0001100110010000", 235 => "0001011111111100", 236 => "0001011001100111", 
    237 => "0001010011010001", 238 => "0001001100111010", 239 => "0001000110100011", 
    240 => "0001000000001011", 241 => "0000111001110010", 242 => "0000110011011001", 
    243 => "0000101100111111", 244 => "0000100110100100", 245 => "0000100000001001", 
    246 => "0000011001101110", 247 => "0000010011010011", 248 => "0000001100110111", 
    249 => "0000000110011100", 250 => "0000000000000000", 251 => "1111111001100100", 
    252 => "1111110011001001", 253 => "1111101100101101", 254 => "1111100110010010", 
    255 => "1111011111110111", 256 => "1111011001011100", 257 => "1111010011000001", 
    258 => "1111001100100111", 259 => "1111000110001110", 260 => "1110111111110101", 
    261 => "1110111001011101", 262 => "1110110011000110", 263 => "1110101100101111", 
    264 => "1110100110011001", 265 => "1110100000000100", 266 => "1110011001110000", 
    267 => "1110010011011101", 268 => "1110001101001011", 269 => "1110000110111011", 
    270 => "1110000000101011", 271 => "1101111010011101", 272 => "1101110100010000", 
    273 => "1101101110000101", 274 => "1101100111111011", 275 => "1101100001110010", 
    276 => "1101011011101100", 277 => "1101010101100111", 278 => "1101001111100011", 
    279 => "1101001001100001", 280 => "1101000011100010", 281 => "1100111101100100", 
    282 => "1100110111101000", 283 => "1100110001101110", 284 => "1100101011110110", 
    285 => "1100100110000000", 286 => "1100100000001101", 287 => "1100011010011100", 
    288 => "1100010100101101", 289 => "1100001111000000", 290 => "1100001001010110", 
    291 => "1100000011101111", 292 => "1011111110001010", 293 => "1011111000100111", 
    294 => "1011110011001000", 295 => "1011101101101011", 296 => "1011101000010000", 
    297 => "1011100010111001", 298 => "1011011101100100", 299 => "1011011000010011", 
    300 => "1011010011000100", 301 => "1011001101111000", 302 => "1011001000110000", 
    303 => "1011000011101011", 304 => "1010111110101000", 305 => "1010111001101010", 
    306 => "1010110100101110", 307 => "1010101111110110", 308 => "1010101011000001", 
    309 => "1010100110001111", 310 => "1010100001100001", 311 => "1010011100110111", 
    312 => "1010011000010000", 313 => "1010010011101101", 314 => "1010001111001110", 
    315 => "1010001010110010", 316 => "1010000110011010", 317 => "1010000010000110", 
    318 => "1001111101110101", 319 => "1001111001101001", 320 => "1001110101100001", 
    321 => "1001110001011100", 322 => "1001101101011100", 323 => "1001101001011111", 
    324 => "1001100101100111", 325 => "1001100001110011", 326 => "1001011110000011", 
    327 => "1001011010010111", 328 => "1001010110110000", 329 => "1001010011001101", 
    330 => "1001001111101110", 331 => "1001001100010011", 332 => "1001001000111101", 
    333 => "1001000101101100", 334 => "1001000010011111", 335 => "1000111111010110", 
    336 => "1000111100010010", 337 => "1000111001010010", 338 => "1000110110010111", 
    339 => "1000110011100001", 340 => "1000110000110000", 341 => "1000101110000011", 
    342 => "1000101011011010", 343 => "1000101000110111", 344 => "1000100110011000", 
    345 => "1000100011111110", 346 => "1000100001101001", 347 => "1000011111011001", 
    348 => "1000011101001101", 349 => "1000011011000110", 350 => "1000011001000101", 
    351 => "1000010111001000", 352 => "1000010101010000", 353 => "1000010011011101", 
    354 => "1000010001101111", 355 => "1000010000000110", 356 => "1000001110100011", 
    357 => "1000001101000100", 358 => "1000001011101010", 359 => "1000001010010101", 
    360 => "1000001001000101", 361 => "1000000111111011", 362 => "1000000110110101", 
    363 => "1000000101110101", 364 => "1000000100111010", 365 => "1000000100000011", 
    366 => "1000000011010010", 367 => "1000000010100110", 368 => "1000000010000000", 
    369 => "1000000001011110", 370 => "1000000001000010", 371 => "1000000000101010", 
    372 => "1000000000011000", 373 => "1000000000001011", 374 => "1000000000000100", 
    375 => "1000000000000001", 376 => "1000000000000100", 377 => "1000000000001011", 
    378 => "1000000000011000", 379 => "1000000000101010", 380 => "1000000001000010", 
    381 => "1000000001011110", 382 => "1000000010000000", 383 => "1000000010100110", 
    384 => "1000000011010010", 385 => "1000000100000011", 386 => "1000000100111010", 
    387 => "1000000101110101", 388 => "1000000110110101", 389 => "1000000111111011", 
    390 => "1000001001000101", 391 => "1000001010010101", 392 => "1000001011101010", 
    393 => "1000001101000100", 394 => "1000001110100011", 395 => "1000010000000110", 
    396 => "1000010001101111", 397 => "1000010011011101", 398 => "1000010101010000", 
    399 => "1000010111001000", 400 => "1000011001000101", 401 => "1000011011000110", 
    402 => "1000011101001101", 403 => "1000011111011001", 404 => "1000100001101001", 
    405 => "1000100011111110", 406 => "1000100110011000", 407 => "1000101000110111", 
    408 => "1000101011011010", 409 => "1000101110000011", 410 => "1000110000110000", 
    411 => "1000110011100001", 412 => "1000110110010111", 413 => "1000111001010010", 
    414 => "1000111100010010", 415 => "1000111111010110", 416 => "1001000010011111", 
    417 => "1001000101101100", 418 => "1001001000111101", 419 => "1001001100010011", 
    420 => "1001001111101110", 421 => "1001010011001101", 422 => "1001010110110000", 
    423 => "1001011010010111", 424 => "1001011110000011", 425 => "1001100001110011", 
    426 => "1001100101100111", 427 => "1001101001011111", 428 => "1001101101011100", 
    429 => "1001110001011100", 430 => "1001110101100001", 431 => "1001111001101001", 
    432 => "1001111101110101", 433 => "1010000010000110", 434 => "1010000110011010", 
    435 => "1010001010110010", 436 => "1010001111001110", 437 => "1010010011101101", 
    438 => "1010011000010000", 439 => "1010011100110111", 440 => "1010100001100001", 
    441 => "1010100110001111", 442 => "1010101011000001", 443 => "1010101111110110", 
    444 => "1010110100101110", 445 => "1010111001101010", 446 => "1010111110101000", 
    447 => "1011000011101011", 448 => "1011001000110000", 449 => "1011001101111000", 
    450 => "1011010011000100", 451 => "1011011000010011", 452 => "1011011101100100", 
    453 => "1011100010111001", 454 => "1011101000010000", 455 => "1011101101101011", 
    456 => "1011110011001000", 457 => "1011111000100111", 458 => "1011111110001010", 
    459 => "1100000011101111", 460 => "1100001001010110", 461 => "1100001111000000", 
    462 => "1100010100101101", 463 => "1100011010011100", 464 => "1100100000001101", 
    465 => "1100100110000000", 466 => "1100101011110110", 467 => "1100110001101110", 
    468 => "1100110111101000", 469 => "1100111101100100", 470 => "1101000011100010", 
    471 => "1101001001100001", 472 => "1101001111100011", 473 => "1101010101100111", 
    474 => "1101011011101100", 475 => "1101100001110010", 476 => "1101100111111011", 
    477 => "1101101110000101", 478 => "1101110100010000", 479 => "1101111010011101", 
    480 => "1110000000101011", 481 => "1110000110111011", 482 => "1110001101001011", 
    483 => "1110010011011101", 484 => "1110011001110000", 485 => "1110100000000100", 
    486 => "1110100110011001", 487 => "1110101100101111", 488 => "1110110011000110", 
    489 => "1110111001011101", 490 => "1110111111110101", 491 => "1111000110001110", 
    492 => "1111001100100111", 493 => "1111010011000001", 494 => "1111011001011100", 
    495 => "1111011111110111", 496 => "1111100110010010", 497 => "1111101100101101", 
    498 => "1111110011001001", 499 => "1111111001100100", 500 => "0000000000000000", 
    501 => "0000000110011100", 502 => "0000001100110111", 503 => "0000010011010011", 
    504 => "0000011001101110", 505 => "0000100000001001", 506 => "0000100110100100", 
    507 => "0000101100111111", 508 => "0000110011011001", 509 => "0000111001110010", 
    510 => "0001000000001011", 511 => "0001000110100011", 512 => "0001001100111010", 
    513 => "0001010011010001", 514 => "0001011001100111", 515 => "0001011111111100", 
    516 => "0001100110010000", 517 => "0001101100100011", 518 => "0001110010110101", 
    519 => "0001111001000101", 520 => "0001111111010101", 521 => "0010000101100011", 
    522 => "0010001011110000", 523 => "0010010001111011", 524 => "0010011000000101", 
    525 => "0010011110001110", 526 => "0010100100010100", 527 => "0010101010011001", 
    528 => "0010110000011101", 529 => "0010110110011111", 530 => "0010111100011110", 
    531 => "0011000010011100", 532 => "0011001000011000", 533 => "0011001110010010", 
    534 => "0011010100001010", 535 => "0011011010000000", 536 => "0011011111110011", 
    537 => "0011100101100100", 538 => "0011101011010011", 539 => "0011110001000000", 
    540 => "0011110110101010", 541 => "0011111100010001", 542 => "0100000001110110", 
    543 => "0100000111011001", 544 => "0100001100111000", 545 => "0100010010010101", 
    546 => "0100010111110000", 547 => "0100011101000111", 548 => "0100100010011100", 
    549 => "0100100111101101", 550 => "0100101100111100", 551 => "0100110010001000", 
    552 => "0100110111010000", 553 => "0100111100010101", 554 => "0101000001011000", 
    555 => "0101000110010110", 556 => "0101001011010010", 557 => "0101010000001010", 
    558 => "0101010100111111", 559 => "0101011001110001", 560 => "0101011110011111", 
    561 => "0101100011001001", 562 => "0101100111110000", 563 => "0101101100010011", 
    564 => "0101110000110010", 565 => "0101110101001110", 566 => "0101111001100110", 
    567 => "0101111101111010", 568 => "0110000010001011", 569 => "0110000110010111", 
    570 => "0110001010011111", 571 => "0110001110100100", 572 => "0110010010100100", 
    573 => "0110010110100001", 574 => "0110011010011001", 575 => "0110011110001101", 
    576 => "0110100001111101", 577 => "0110100101101001", 578 => "0110101001010000", 
    579 => "0110101100110011", 580 => "0110110000010010", 581 => "0110110011101101", 
    582 => "0110110111000011", 583 => "0110111010010100", 584 => "0110111101100001", 
    585 => "0111000000101010", 586 => "0111000011101110", 587 => "0111000110101110", 
    588 => "0111001001101001", 589 => "0111001100011111", 590 => "0111001111010000", 
    591 => "0111010001111101", 592 => "0111010100100110", 593 => "0111010111001001", 
    594 => "0111011001101000", 595 => "0111011100000010", 596 => "0111011110010111", 
    597 => "0111100000100111", 598 => "0111100010110011", 599 => "0111100100111010", 
    600 => "0111100110111011", 601 => "0111101000111000", 602 => "0111101010110000", 
    603 => "0111101100100011", 604 => "0111101110010001", 605 => "0111101111111010", 
    606 => "0111110001011101", 607 => "0111110010111100", 608 => "0111110100010110", 
    609 => "0111110101101011", 610 => "0111110110111011", 611 => "0111111000000101", 
    612 => "0111111001001011", 613 => "0111111010001011", 614 => "0111111011000110", 
    615 => "0111111011111101", 616 => "0111111100101110", 617 => "0111111101011010", 
    618 => "0111111110000000", 619 => "0111111110100010", 620 => "0111111110111110", 
    621 => "0111111111010110", 622 => "0111111111101000", 623 => "0111111111110101", 
    624 => "0111111111111100", 625 => "0111111111111111", 626 => "0111111111111100", 
    627 => "0111111111110101", 628 => "0111111111101000", 629 => "0111111111010110", 
    630 => "0111111110111110", 631 => "0111111110100010", 632 => "0111111110000000", 
    633 => "0111111101011010", 634 => "0111111100101110", 635 => "0111111011111101", 
    636 => "0111111011000110", 637 => "0111111010001011", 638 => "0111111001001011", 
    639 => "0111111000000101", 640 => "0111110110111011", 641 => "0111110101101011", 
    642 => "0111110100010110", 643 => "0111110010111100", 644 => "0111110001011101", 
    645 => "0111101111111010", 646 => "0111101110010001", 647 => "0111101100100011", 
    648 => "0111101010110000", 649 => "0111101000111000", 650 => "0111100110111011", 
    651 => "0111100100111010", 652 => "0111100010110011", 653 => "0111100000100111", 
    654 => "0111011110010111", 655 => "0111011100000010", 656 => "0111011001101000", 
    657 => "0111010111001001", 658 => "0111010100100110", 659 => "0111010001111101", 
    660 => "0111001111010000", 661 => "0111001100011111", 662 => "0111001001101001", 
    663 => "0111000110101110", 664 => "0111000011101110", 665 => "0111000000101010", 
    666 => "0110111101100001", 667 => "0110111010010100", 668 => "0110110111000011", 
    669 => "0110110011101101", 670 => "0110110000010010", 671 => "0110101100110011", 
    672 => "0110101001010000", 673 => "0110100101101001", 674 => "0110100001111101", 
    675 => "0110011110001101", 676 => "0110011010011001", 677 => "0110010110100001", 
    678 => "0110010010100100", 679 => "0110001110100100", 680 => "0110001010011111", 
    681 => "0110000110010111", 682 => "0110000010001011", 683 => "0101111101111010", 
    684 => "0101111001100110", 685 => "0101110101001110", 686 => "0101110000110010", 
    687 => "0101101100010011", 688 => "0101100111110000", 689 => "0101100011001001", 
    690 => "0101011110011111", 691 => "0101011001110001", 692 => "0101010100111111", 
    693 => "0101010000001010", 694 => "0101001011010010", 695 => "0101000110010110", 
    696 => "0101000001011000", 697 => "0100111100010101", 698 => "0100110111010000", 
    699 => "0100110010001000", 700 => "0100101100111100", 701 => "0100100111101101", 
    702 => "0100100010011100", 703 => "0100011101000111", 704 => "0100010111110000", 
    705 => "0100010010010101", 706 => "0100001100111000", 707 => "0100000111011001", 
    708 => "0100000001110110", 709 => "0011111100010001", 710 => "0011110110101010", 
    711 => "0011110001000000", 712 => "0011101011010011", 713 => "0011100101100100", 
    714 => "0011011111110011", 715 => "0011011010000000", 716 => "0011010100001010", 
    717 => "0011001110010010", 718 => "0011001000011000", 719 => "0011000010011100", 
    720 => "0010111100011110", 721 => "0010110110011111", 722 => "0010110000011101", 
    723 => "0010101010011001", 724 => "0010100100010100", 725 => "0010011110001110", 
    726 => "0010011000000101", 727 => "0010010001111011", 728 => "0010001011110000", 
    729 => "0010000101100011", 730 => "0001111111010101", 731 => "0001111001000101", 
    732 => "0001110010110101", 733 => "0001101100100011", 734 => "0001100110010000", 
    735 => "0001011111111100", 736 => "0001011001100111", 737 => "0001010011010001", 
    738 => "0001001100111010", 739 => "0001000110100011", 740 => "0001000000001011", 
    741 => "0000111001110010", 742 => "0000110011011001", 743 => "0000101100111111", 
    744 => "0000100110100100", 745 => "0000100000001001", 746 => "0000011001101110", 
    747 => "0000010011010011", 748 => "0000001100110111", 749 => "0000000110011100", 
    750 => "0000000000000000", 751 => "1111111001100100", 752 => "1111110011001001", 
    753 => "1111101100101101", 754 => "1111100110010010", 755 => "1111011111110111", 
    756 => "1111011001011100", 757 => "1111010011000001", 758 => "1111001100100111", 
    759 => "1111000110001110", 760 => "1110111111110101", 761 => "1110111001011101", 
    762 => "1110110011000110", 763 => "1110101100101111", 764 => "1110100110011001", 
    765 => "1110100000000100", 766 => "1110011001110000", 767 => "1110010011011101", 
    768 => "1110001101001011", 769 => "1110000110111011", 770 => "1110000000101011", 
    771 => "1101111010011101", 772 => "1101110100010000", 773 => "1101101110000101", 
    774 => "1101100111111011", 775 => "1101100001110010", 776 => "1101011011101100", 
    777 => "1101010101100111", 778 => "1101001111100011", 779 => "1101001001100001", 
    780 => "1101000011100010", 781 => "1100111101100100", 782 => "1100110111101000", 
    783 => "1100110001101110", 784 => "1100101011110110", 785 => "1100100110000000", 
    786 => "1100100000001101", 787 => "1100011010011100", 788 => "1100010100101101", 
    789 => "1100001111000000", 790 => "1100001001010110", 791 => "1100000011101111", 
    792 => "1011111110001010", 793 => "1011111000100111", 794 => "1011110011001000", 
    795 => "1011101101101011", 796 => "1011101000010000", 797 => "1011100010111001", 
    798 => "1011011101100100", 799 => "1011011000010011", 800 => "1011010011000100", 
    801 => "1011001101111000", 802 => "1011001000110000", 803 => "1011000011101011", 
    804 => "1010111110101000", 805 => "1010111001101010", 806 => "1010110100101110", 
    807 => "1010101111110110", 808 => "1010101011000001", 809 => "1010100110001111", 
    810 => "1010100001100001", 811 => "1010011100110111", 812 => "1010011000010000", 
    813 => "1010010011101101", 814 => "1010001111001110", 815 => "1010001010110010", 
    816 => "1010000110011010", 817 => "1010000010000110", 818 => "1001111101110101", 
    819 => "1001111001101001", 820 => "1001110101100001", 821 => "1001110001011100", 
    822 => "1001101101011100", 823 => "1001101001011111", 824 => "1001100101100111", 
    825 => "1001100001110011", 826 => "1001011110000011", 827 => "1001011010010111", 
    828 => "1001010110110000", 829 => "1001010011001101", 830 => "1001001111101110", 
    831 => "1001001100010011", 832 => "1001001000111101", 833 => "1001000101101100", 
    834 => "1001000010011111", 835 => "1000111111010110", 836 => "1000111100010010", 
    837 => "1000111001010010", 838 => "1000110110010111", 839 => "1000110011100001", 
    840 => "1000110000110000", 841 => "1000101110000011", 842 => "1000101011011010", 
    843 => "1000101000110111", 844 => "1000100110011000", 845 => "1000100011111110", 
    846 => "1000100001101001", 847 => "1000011111011001", 848 => "1000011101001101", 
    849 => "1000011011000110", 850 => "1000011001000101", 851 => "1000010111001000", 
    852 => "1000010101010000", 853 => "1000010011011101", 854 => "1000010001101111", 
    855 => "1000010000000110", 856 => "1000001110100011", 857 => "1000001101000100", 
    858 => "1000001011101010", 859 => "1000001010010101", 860 => "1000001001000101", 
    861 => "1000000111111011", 862 => "1000000110110101", 863 => "1000000101110101", 
    864 => "1000000100111010", 865 => "1000000100000011", 866 => "1000000011010010", 
    867 => "1000000010100110", 868 => "1000000010000000", 869 => "1000000001011110", 
    870 => "1000000001000010", 871 => "1000000000101010", 872 => "1000000000011000", 
    873 => "1000000000001011", 874 => "1000000000000100", 875 => "1000000000000001", 
    876 => "1000000000000100", 877 => "1000000000001011", 878 => "1000000000011000", 
    879 => "1000000000101010", 880 => "1000000001000010", 881 => "1000000001011110", 
    882 => "1000000010000000", 883 => "1000000010100110", 884 => "1000000011010010", 
    885 => "1000000100000011", 886 => "1000000100111010", 887 => "1000000101110101", 
    888 => "1000000110110101", 889 => "1000000111111011", 890 => "1000001001000101", 
    891 => "1000001010010101", 892 => "1000001011101010", 893 => "1000001101000100", 
    894 => "1000001110100011", 895 => "1000010000000110", 896 => "1000010001101111", 
    897 => "1000010011011101", 898 => "1000010101010000", 899 => "1000010111001000", 
    900 => "1000011001000101", 901 => "1000011011000110", 902 => "1000011101001101", 
    903 => "1000011111011001", 904 => "1000100001101001", 905 => "1000100011111110", 
    906 => "1000100110011000", 907 => "1000101000110111", 908 => "1000101011011010", 
    909 => "1000101110000011", 910 => "1000110000110000", 911 => "1000110011100001", 
    912 => "1000110110010111", 913 => "1000111001010010", 914 => "1000111100010010", 
    915 => "1000111111010110", 916 => "1001000010011111", 917 => "1001000101101100", 
    918 => "1001001000111101", 919 => "1001001100010011", 920 => "1001001111101110", 
    921 => "1001010011001101", 922 => "1001010110110000", 923 => "1001011010010111", 
    924 => "1001011110000011", 925 => "1001100001110011", 926 => "1001100101100111", 
    927 => "1001101001011111", 928 => "1001101101011100", 929 => "1001110001011100", 
    930 => "1001110101100001", 931 => "1001111001101001", 932 => "1001111101110101", 
    933 => "1010000010000110", 934 => "1010000110011010", 935 => "1010001010110010", 
    936 => "1010001111001110", 937 => "1010010011101101", 938 => "1010011000010000", 
    939 => "1010011100110111", 940 => "1010100001100001", 941 => "1010100110001111", 
    942 => "1010101011000001", 943 => "1010101111110110", 944 => "1010110100101110", 
    945 => "1010111001101010", 946 => "1010111110101000", 947 => "1011000011101011", 
    948 => "1011001000110000", 949 => "1011001101111000", 950 => "1011010011000100", 
    951 => "1011011000010011", 952 => "1011011101100100", 953 => "1011100010111001", 
    954 => "1011101000010000", 955 => "1011101101101011", 956 => "1011110011001000", 
    957 => "1011111000100111", 958 => "1011111110001010", 959 => "1100000011101111", 
    960 => "1100001001010110", 961 => "1100001111000000", 962 => "1100010100101101", 
    963 => "1100011010011100", 964 => "1100100000001101", 965 => "1100100110000000", 
    966 => "1100101011110110", 967 => "1100110001101110", 968 => "1100110111101000", 
    969 => "1100111101100100", 970 => "1101000011100010", 971 => "1101001001100001", 
    972 => "1101001111100011", 973 => "1101010101100111", 974 => "1101011011101100", 
    975 => "1101100001110010", 976 => "1101100111111011", 977 => "1101101110000101", 
    978 => "1101110100010000", 979 => "1101111010011101", 980 => "1110000000101011", 
    981 => "1110000110111011", 982 => "1110001101001011", 983 => "1110010011011101", 
    984 => "1110011001110000", 985 => "1110100000000100", 986 => "1110100110011001", 
    987 => "1110101100101111", 988 => "1110110011000110", 989 => "1110111001011101", 
    990 => "1110111111110101", 991 => "1111000110001110", 992 => "1111001100100111", 
    993 => "1111010011000001", 994 => "1111011001011100", 995 => "1111011111110111", 
    996 => "1111100110010010", 997 => "1111101100101101", 998 => "1111110011001001", 
    999 => "1111111001100100" );


attribute EQUIVALENT_REGISTER_REMOVAL : string;
begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;


Library IEEE;
use IEEE.std_logic_1164.all;

entity Park_Inverse_sin_cud is
    generic (
        DataWidth : INTEGER := 16;
        AddressRange : INTEGER := 1000;
        AddressWidth : INTEGER := 10);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of Park_Inverse_sin_cud is
    component Park_Inverse_sin_cud_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    Park_Inverse_sin_cud_rom_U :  component Park_Inverse_sin_cud_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


