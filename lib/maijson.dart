// To parse this JSON data, do
//
//     final menu = menuFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';
Menu menuFromJson(String str) => Menu.fromJson(json.decode(str));

String menuToJson(Menu data) => json.encode(data.toJson());

class Menu {
    Menu({
        this.almuerzos,
        this.pizzas,
        this.calzoneDeLaAbuela,
        this.tablas,
        this.bruschettas,
        this.lasagnaLasaa,
        this.raviolesRavioli,
        this.ensaladas,
        this.crpes,
        this.cremas,
        this.bebidas,
    });

    Almuerzos almuerzos;
    Pizzas pizzas;
    CalzoneDeLaAbuela calzoneDeLaAbuela;
    Tablas tablas;
    Bruschettas bruschettas;
    LasagnaLasaa lasagnaLasaa;
    RaviolesRavioli raviolesRavioli;
    Ensaladas ensaladas;
    Crpes crpes;
    Cremas cremas;
    Bebidas bebidas;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        almuerzos: Almuerzos.fromJson(json["Almuerzos"]),
        pizzas: Pizzas.fromJson(json["Pizzas"]),
        calzoneDeLaAbuela: CalzoneDeLaAbuela.fromJson(json["CALZONE \"DE LA ABUELA\""]),
        tablas: Tablas.fromJson(json["Tablas"]),
        bruschettas: Bruschettas.fromJson(json["BRUSCHETTAS"]),
        lasagnaLasaa: LasagnaLasaa.fromJson(json["LASAGNA / LASAÑA"]),
        raviolesRavioli: RaviolesRavioli.fromJson(json["RAVIOLES / RAVIOLI"]),
        ensaladas: Ensaladas.fromJson(json["ENSALADAS"]),
        crpes: Crpes.fromJson(json["CRÊPES"]),
        cremas: Cremas.fromJson(json["CREMAS"]),
        bebidas: Bebidas.fromJson(json["BEBIDAS"]),
    );

    Map<String, dynamic> toJson() => {
        "Almuerzos": almuerzos.toJson(),
        "Pizzas": pizzas.toJson(),
        "CALZONE \"DE LA ABUELA\"": calzoneDeLaAbuela.toJson(),
        "Tablas": tablas.toJson(),
        "BRUSCHETTAS": bruschettas.toJson(),
        "LASAGNA / LASAÑA": lasagnaLasaa.toJson(),
        "RAVIOLES / RAVIOLI": raviolesRavioli.toJson(),
        "ENSALADAS": ensaladas.toJson(),
        "CRÊPES": crpes.toJson(),
        "CREMAS": cremas.toJson(),
        "BEBIDAS": bebidas.toJson(),
    };
}

class Almuerzos {
    Almuerzos({
        this.pastaAlHuevoArtesanal,
        this.salsa,
        this.acompaamientosToppings,
    });

    List<String> pastaAlHuevoArtesanal;
    List<String> salsa;
    List<String> acompaamientosToppings;

    factory Almuerzos.fromJson(Map<String, dynamic> json) => Almuerzos(
        pastaAlHuevoArtesanal: List<String>.from(json["Pasta al huevo artesanal"].map((x) => x)),
        salsa: List<String>.from(json["Salsa"].map((x) => x)),
        acompaamientosToppings: List<String>.from(json["Acompañamientos/Toppings"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "Pasta al huevo artesanal": List<dynamic>.from(pastaAlHuevoArtesanal.map((x) => x)),
        "Salsa": List<dynamic>.from(salsa.map((x) => x)),
        "Acompañamientos/Toppings": List<dynamic>.from(acompaamientosToppings.map((x) => x)),
    };
}

class Bebidas {
    Bebidas({
        this.limonada,
        this.naranjada,
        this.chichaDeMazMorado,
        this.gaseosaRegular,
        this.kolaEscocesaRegular,
        this.schweppes,
        this.redbull,
        this.agua,
        this.jugosDeFrutaNaturales,
        this.bebidasCalientes,
    });

    ChichaDeMazMorado limonada;
    ChichaDeMazMorado naranjada;
    ChichaDeMazMorado chichaDeMazMorado;
    GaseosaRegular gaseosaRegular;
    ChichaDeMazMorado kolaEscocesaRegular;
    Agua schweppes;
    Agua redbull;
    Agua agua;
    Map<String, int> jugosDeFrutaNaturales;
    BebidasCalientes bebidasCalientes;

    factory Bebidas.fromJson(Map<String, dynamic> json) => Bebidas(
        limonada: ChichaDeMazMorado.fromJson(json["LIMONADA"]),
        naranjada: ChichaDeMazMorado.fromJson(json["NARANJADA"]),
        chichaDeMazMorado: ChichaDeMazMorado.fromJson(json["CHICHA DE MAÍZ MORADO"]),
        gaseosaRegular: GaseosaRegular.fromJson(json["GASEOSA REGULAR"]),
        kolaEscocesaRegular: ChichaDeMazMorado.fromJson(json["KOLA ESCOCESA REGULAR"]),
        schweppes: Agua.fromJson(json["SCHWEPPES"]),
        redbull: Agua.fromJson(json["REDBULL"]),
        agua: Agua.fromJson(json["AGUA"]),
        jugosDeFrutaNaturales: Map.from(json["JUGOS DE FRUTA NATURALES"]).map((k, v) => MapEntry<String, int>(k, v)),
        bebidasCalientes: BebidasCalientes.fromJson(json["BEBIDAS CALIENTES"]),
    );

    Map<String, dynamic> toJson() => {
        "LIMONADA": limonada.toJson(),
        "NARANJADA": naranjada.toJson(),
        "CHICHA DE MAÍZ MORADO": chichaDeMazMorado.toJson(),
        "GASEOSA REGULAR": gaseosaRegular.toJson(),
        "KOLA ESCOCESA REGULAR": kolaEscocesaRegular.toJson(),
        "SCHWEPPES": schweppes.toJson(),
        "REDBULL": redbull.toJson(),
        "AGUA": agua.toJson(),
        "JUGOS DE FRUTA NATURALES": Map.from(jugosDeFrutaNaturales).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "BEBIDAS CALIENTES": bebidasCalientes.toJson(),
    };
}

class Agua {
    Agua({
        this.the1L,
    });

    int the1L;

    factory Agua.fromJson(Map<String, dynamic> json) => Agua(
        the1L: json["1L"],
    );

    Map<String, dynamic> toJson() => {
        "1L": the1L,
    };
}

class BebidasCalientes {
    BebidasCalientes({
        this.infusiones,
        this.bebidasFras,
        this.caf,
        this.cappuccinos,
        this.latte,
    });

    Infusiones infusiones;
    Map<String, int> bebidasFras;
    Caf caf;
    Cappuccinos cappuccinos;
    Latte latte;

    factory BebidasCalientes.fromJson(Map<String, dynamic> json) => BebidasCalientes(
        infusiones: Infusiones.fromJson(json["INFUSIONES"]),
        bebidasFras: Map.from(json["BEBIDAS FRÍAS"]).map((k, v) => MapEntry<String, int>(k, v)),
        caf: Caf.fromJson(json["CAFÉ"]),
        cappuccinos: Cappuccinos.fromJson(json["CAPPUCCINOS"]),
        latte: Latte.fromJson(json["LATTE"]),
    );

    Map<String, dynamic> toJson() => {
        "INFUSIONES": infusiones.toJson(),
        "BEBIDAS FRÍAS": Map.from(bebidasFras).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "CAFÉ": caf.toJson(),
        "CAPPUCCINOS": cappuccinos.toJson(),
        "LATTE": latte.toJson(),
    };
}

class Caf {
    Caf({
        this.simple,
        this.doble,
        this.americano,
        this.chantilly,
        this.cortado,
        this.macchiato,
    });

    int simple;
    int doble;
    int americano;
    int chantilly;
    int cortado;
    int macchiato;

    factory Caf.fromJson(Map<String, dynamic> json) => Caf(
        simple: json["SIMPLE"],
        doble: json["DOBLE"],
        americano: json["AMERICANO"],
        chantilly: json["CHANTILLY"],
        cortado: json["CORTADO"],
        macchiato: json["MACCHIATO"],
    );

    Map<String, dynamic> toJson() => {
        "SIMPLE": simple,
        "DOBLE": doble,
        "AMERICANO": americano,
        "CHANTILLY": chantilly,
        "CORTADO": cortado,
        "MACCHIATO": macchiato,
    };
}

class Cappuccinos {
    Cappuccinos({
        this.simple,
        this.chantilly,
        this.cawi,
    });

    int simple;
    int chantilly;
    int cawi;

    factory Cappuccinos.fromJson(Map<String, dynamic> json) => Cappuccinos(
        simple: json["SIMPLE"],
        chantilly: json["CHANTILLY"],
        cawi: json["CAWI"],
    );

    Map<String, dynamic> toJson() => {
        "SIMPLE": simple,
        "CHANTILLY": chantilly,
        "CAWI": cawi,
    };
}

class Infusiones {
    Infusiones({
        this.t,
        this.infusiones,
        this.emoliente,
    });

    Emoliente t;
    Emoliente infusiones;
    Emoliente emoliente;

    factory Infusiones.fromJson(Map<String, dynamic> json) => Infusiones(
        t: Emoliente.fromJson(json["TÉ"]),
        infusiones: Emoliente.fromJson(json["INFUSIONES"]),
        emoliente: Emoliente.fromJson(json["EMOLIENTE"]),
    );

    Map<String, dynamic> toJson() => {
        "TÉ": t.toJson(),
        "INFUSIONES": infusiones.toJson(),
        "EMOLIENTE": emoliente.toJson(),
    };
}

class Emoliente {
    Emoliente({
        this.precio,
        this.tipo,
    });

    int precio;
    List<String> tipo;

    factory Emoliente.fromJson(Map<String, dynamic> json) => Emoliente(
        precio: json["PRECIO"],
        tipo: List<String>.from(json["TIPO"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "PRECIO": precio,
        "TIPO": List<dynamic>.from(tipo.map((x) => x)),
    };
}

class Latte {
    Latte({
        this.simple,
        this.vanela,
        this.baileys,
        this.caramelo,
        this.mocca,
        this.submarino,
    });

    int simple;
    int vanela;
    int baileys;
    int caramelo;
    int mocca;
    int submarino;

    factory Latte.fromJson(Map<String, dynamic> json) => Latte(
        simple: json["SIMPLE"],
        vanela: json["VANELA"],
        baileys: json["BAILEYS"],
        caramelo: json["CARAMELO"],
        mocca: json["MOCCA"],
        submarino: json["SUBMARINO"],
    );

    Map<String, dynamic> toJson() => {
        "SIMPLE": simple,
        "VANELA": vanela,
        "BAILEYS": baileys,
        "CARAMELO": caramelo,
        "MOCCA": mocca,
        "SUBMARINO": submarino,
    };
}

class ChichaDeMazMorado {
    ChichaDeMazMorado({
        this.the1L,
        this.the2L,
    });

    double the1L;
    int the2L;

    factory ChichaDeMazMorado.fromJson(Map<String, dynamic> json) => ChichaDeMazMorado(
        the1L: json["1L"].toDouble(),
        the2L: json["2L"],
    );

    Map<String, dynamic> toJson() => {
        "1L": the1L,
        "2L": the2L,
    };
}

class GaseosaRegular {
    GaseosaRegular({
        this.the1L,
        this.the2L,
        this.tipos,
    });

    int the1L;
    int the2L;
    List<String> tipos;

    factory GaseosaRegular.fromJson(Map<String, dynamic> json) => GaseosaRegular(
        the1L: json["1L"],
        the2L: json["2L"],
        tipos: List<String>.from(json["TIPOS"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "1L": the1L,
        "2L": the2L,
        "TIPOS": List<dynamic>.from(tipos.map((x) => x)),
    };
}

class Bruschettas {
    Bruschettas({
        this.simple,
        this.especial,
        this.paPicar,
        this.campesina,
    });

    int simple;
    int especial;
    int paPicar;
    int campesina;

    factory Bruschettas.fromJson(Map<String, dynamic> json) => Bruschettas(
        simple: json["SIMPLE"],
        especial: json["ESPECIAL"],
        paPicar: json["PA ́PICAR"],
        campesina: json["CAMPESINA"],
    );

    Map<String, dynamic> toJson() => {
        "SIMPLE": simple,
        "ESPECIAL": especial,
        "PA ́PICAR": paPicar,
        "CAMPESINA": campesina,
    };
}

class CalzoneDeLaAbuela {
    CalzoneDeLaAbuela({
        this.bsico,
        this.mixto,
        this.picante,
        this.vegano,
        this.dulce,
    });

    int bsico;
    int mixto;
    int picante;
    int vegano;
    int dulce;

    factory CalzoneDeLaAbuela.fromJson(Map<String, dynamic> json) => CalzoneDeLaAbuela(
        bsico: json["BÁSICO"],
        mixto: json["MIXTO"],
        picante: json["PICANTE"],
        vegano: json["VEGANO"],
        dulce: json["DULCE"],
    );

    Map<String, dynamic> toJson() => {
        "BÁSICO": bsico,
        "MIXTO": mixto,
        "PICANTE": picante,
        "VEGANO": vegano,
        "DULCE": dulce,
    };
}

class Cremas {
    Cremas({
        this.championes,
        this.esprragos,
        this.espinaca,
        this.zapallo,
    });

    int championes;
    int esprragos;
    int espinaca;
    int zapallo;

    factory Cremas.fromJson(Map<String, dynamic> json) => Cremas(
        championes: json["CHAMPIÑONES"],
        esprragos: json["ESPÁRRAGOS"],
        espinaca: json["ESPINACA"],
        zapallo: json["ZAPALLO"],
    );

    Map<String, dynamic> toJson() => {
        "CHAMPIÑONES": championes,
        "ESPÁRRAGOS": esprragos,
        "ESPINACA": espinaca,
        "ZAPALLO": zapallo,
    };
}

class Crpes {
    Crpes({
        this.dulces,
        this.salados,
    });

    Map<String, int> dulces;
    Salados salados;

    factory Crpes.fromJson(Map<String, dynamic> json) => Crpes(
        dulces: Map.from(json["DULCES"]).map((k, v) => MapEntry<String, int>(k, v)),
        salados: Salados.fromJson(json["SALADOS"]),
    );

    Map<String, dynamic> toJson() => {
        "DULCES": Map.from(dulces).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "SALADOS": salados.toJson(),
    };
}

class Salados {
    Salados({
        this.championesFlambeadosConVinoTintoEspinacaNuecesQuesoAzulYMozzarella,
        this.jamnHuevoYMozzarella,
        this.polloPimientosYMozzarella,
    });

    int championesFlambeadosConVinoTintoEspinacaNuecesQuesoAzulYMozzarella;
    int jamnHuevoYMozzarella;
    int polloPimientosYMozzarella;

    factory Salados.fromJson(Map<String, dynamic> json) => Salados(
        championesFlambeadosConVinoTintoEspinacaNuecesQuesoAzulYMozzarella: json["CHAMPIÑONES FLAMBEADOS CON VINO TINTO, ESPINACA, NUECES, QUESO AZUL Y MOZZARELLA"],
        jamnHuevoYMozzarella: json["JAMÓN, HUEVO Y MOZZARELLA"],
        polloPimientosYMozzarella: json["POLLO, PIMIENTOS Y MOZZARELLA"],
    );

    Map<String, dynamic> toJson() => {
        "CHAMPIÑONES FLAMBEADOS CON VINO TINTO, ESPINACA, NUECES, QUESO AZUL Y MOZZARELLA": championesFlambeadosConVinoTintoEspinacaNuecesQuesoAzulYMozzarella,
        "JAMÓN, HUEVO Y MOZZARELLA": jamnHuevoYMozzarella,
        "POLLO, PIMIENTOS Y MOZZARELLA": polloPimientosYMozzarella,
    };
}

class Ensaladas {
    Ensaladas({
        this.atnTuna,
        this.tropical,
        this.vegan,
        this.jamonHam,
    });

    int atnTuna;
    int tropical;
    int vegan;
    int jamonHam;

    factory Ensaladas.fromJson(Map<String, dynamic> json) => Ensaladas(
        atnTuna: json["ATÚN “TUNA”"],
        tropical: json["TROPICAL"],
        vegan: json["VEGAN"],
        jamonHam: json["JAMON “HAM”"],
    );

    Map<String, dynamic> toJson() => {
        "ATÚN “TUNA”": atnTuna,
        "TROPICAL": tropical,
        "VEGAN": vegan,
        "JAMON “HAM”": jamonHam,
    };
}

class LasagnaLasaa {
    LasagnaLasaa({
        this.deLaCaeria,
        this.boloesa,
        this.vegana,
    });

    int deLaCaeria;
    int boloesa;
    int vegana;

    factory LasagnaLasaa.fromJson(Map<String, dynamic> json) => LasagnaLasaa(
        deLaCaeria: json["DE LA CAÑERIA"],
        boloesa: json["BOLOÑESA"],
        vegana: json["VEGANA"],
    );

    Map<String, dynamic> toJson() => {
        "DE LA CAÑERIA": deLaCaeria,
        "BOLOÑESA": boloesa,
        "VEGANA": vegana,
    };
}

class Pizzas {
    Pizzas({
        this.bsica,
        this.mixta,
        this.dulceSweet,
    });

    Map<String, Bsica> bsica;
    Map<String, Bsica> mixta;
    DulceSweet dulceSweet;

    factory Pizzas.fromJson(Map<String, dynamic> json) => Pizzas(
        bsica: Map.from(json["Básica"]).map((k, v) => MapEntry<String, Bsica>(k, Bsica.fromJson(v))),
        mixta: Map.from(json["Mixta"]).map((k, v) => MapEntry<String, Bsica>(k, Bsica.fromJson(v))),
        dulceSweet: DulceSweet.fromJson(json["Dulce-Sweet"]),
    );

    Map<String, dynamic> toJson() => {
        "Básica": Map.from(bsica).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "Mixta": Map.from(mixta).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        "Dulce-Sweet": dulceSweet.toJson(),
    };
}

class Bsica {
    Bsica({
        this.personal,
        this.pequea,
        this.mediana,
        this.grande,
    });

    int personal;
    int pequea;
    int mediana;
    int grande;

    factory Bsica.fromJson(Map<String, dynamic> json) => Bsica(
        personal: json["PERSONAL"],
        pequea: json["PEQUEÑA"],
        mediana: json["MEDIANA"],
        grande: json["GRANDE"],
    );

    Map<String, dynamic> toJson() => {
        "PERSONAL": personal,
        "PEQUEÑA": pequea,
        "MEDIANA": mediana,
        "GRANDE": grande,
    };
}

class DulceSweet {
    DulceSweet({
        this.laDolce,
    });

    Bsica laDolce;

    factory DulceSweet.fromJson(Map<String, dynamic> json) => DulceSweet(
        laDolce: Bsica.fromJson(json["LA DOLCE"]),
    );

    Map<String, dynamic> toJson() => {
        "LA DOLCE": laDolce.toJson(),
    };
}

class RaviolesRavioli {
    RaviolesRavioli({
        this.carneMeat,
        this.espinacaSpinach,
    });

    int carneMeat;
    int espinacaSpinach;

    factory RaviolesRavioli.fromJson(Map<String, dynamic> json) => RaviolesRavioli(
        carneMeat: json["CARNE \"MEAT\""],
        espinacaSpinach: json["ESPINACA “SPINACH“"],
    );

    Map<String, dynamic> toJson() => {
        "CARNE \"MEAT\"": carneMeat,
        "ESPINACA “SPINACH“": espinacaSpinach,
    };
}

class Tablas {
    Tablas({
        this.diLeo,
    });

    int diLeo;

    factory Tablas.fromJson(Map<String, dynamic> json) => Tablas(
        diLeo: json["DI'LEO"],
    );

    Map<String, dynamic> toJson() => {
        "DI'LEO": diLeo,
    };
}