#/bin/bash
function help {
    echo "No help yet"
}

function printAddress {
  DATA=$(rig | awk '
    BEGIN{
         aidx=1;
         srand();
       }
       {
         if (NR==2) {
           fieldCount=split($0,streetAddr," ");
           ADDRESS[aidx++]=streetAddr[1];
           for (i=2; i<=fieldCount; i++) {
             street=street" "streetAddr[i];
           }
           sub(/^[ ]+/, "", street);
           ADDRESS[aidx++]="\x27"street"\x27";
         } else if (NR==3) {
           split($0,addr," ");
           sub(/,/, "", addr[1]);
           ADDRESS[aidx++]="\x27"addr[1]"\x27";
           ADDRESS[aidx++]="\x27"addr[2]"\x27";
           ADDRESS[aidx++]="\x27"addr[3]"\x27";
         }
       }
    END{
         print ADDRESS[1]", "ADDRESS[2]", "ADDRESS[3]", "ADDRESS[4]", "ADDRESS[5];
        }')

  echo -e "INSERT INTO ADDRESS VALUE(NULL, "$DATA");"
}

function printEmployee {
  DATA=$(rig -c $1 | awk '
    BEGIN{
         nidx=1;
		 aidx=1;
         srand();
       }
       {
		 if (aidx == 6) {
		   aidx = 1;
		 }
         if (aidx==1) {
           split($0,name," ");
           NAME[nidx++]="\x27"name[1]"\x27";
           NAME[nidx++]="\x27"name[2]"\x27";
         } else if (aidx==4){
           NAME[nidx++]=$0;
         }
		 aidx++;
       }
    END{
		  entries = nidx-1;
		  for (i = 1; i <= entries; i=i+3) {
			ssn="\x27"sprintf("%03d",rand() * 999)sprintf("%02d",rand() * 99)sprintf("%04d",rand() * 9999)"\x27";
		    letterCount=split("Q W E R T Y U I O P A S D F G H J K L Z X C V B N M", letters, " ");
		    minit="\x27"letters[(int(rand()*letterCount + 1))]"\x27";
		    salary="\x27"sprintf("%6.2f",(rand()*100000 + 35000))"\x27";
		    birthyear = (int(rand()*42) + 1945)
		    birthdate="\x27"birthyear""sprintf("%02d", (int(rand()*12)))""sprintf("%02d", (int(rand()*28)))"\x27";
		    hireyear=2015-int(rand()*20+18);
			hiredate="\x27"hireyear""sprintf("%02d", (int(rand()*12)))""sprintf("%02d", (int(rand()*28)))"\x27";
		    addressid=int(rand()*500 + 1);
		    split(NAME[i+2], phone, " ");
            gsub(/[()]/, "", phone[1]);
            ePhone="\x27"phone[1]""(int(rand()*999))""(int(rand()*9999))"\x27";
		    dealerid=int(rand() * 10) + 1001;
            print "(NULL, "ssn", "NAME[i]", "minit", "NAME[i+1]", "addressid", "ePhone", "salary", "birthdate", "hiredate", "dealerid"),\\n";
		  }
		  
       }')

	echo -e "USE FAST3_DEALERSHIP;\n"
	echo -e "INSERT INTO EMPLOYEE VALUES\n"$DATA
}

function printVehicleCustomer {
  DATA=$(rig -c $1 | awk -v count=$1 '
    BEGIN{
         srand();
		 vidx = 1;
		 nidx=1;
		 aidx=1;
		 yidx=1;
		 for (i = 0; i < count; i++) {
			vin=sprintf("%03d", int(rand()*999))sprintf("%06d", int(rand()*999999))sprintf("%04d", int(rand()*9999))sprintf("%04d", int(rand()*9999));
			
			makeCount=split("Ford,Chrysler,Hillman,Chevrolet,Cadillac,BMW,Austin,Fillmore,Fairthorpe,Studebaker,Pontiac,Buick,Rambler,Plymouth,Volkswagen,Jensen,Oldsmobile,Mercury,Shelby,Dodge,Porsche,Toyota,Mercedes-Benz,MG,Nissan,Honda,Renault,Mazda,Mitsubishi,Subaru,Lotus,Lincoln,Maserati,Saab,Audi,Suzuki,Lamborghini,Merkur,Land Rover,Acura,Lexus,Eagle,Alfa Romeo,Daihatsu,Geo,GMC,Hyundai,Infiniti,Isuzu,Jaguar,Jeep,Saturn,Volvo,HUMMER,Kia,Holden,Corbin,Daewoo,MINI,Maybach,Spyker,Scion,Spyker Cars,Aston Martin,Bentley,Panoz,Rolls-Royce,Ferrari,Morgan,Peugeot,Foose,Aptera,Smart,Bugatti,Tesla,Ram,FIAT,McLaren", makes, ",");
		    make="\x27"makes[(int(rand()*makeCount + 1))]"\x27";
			
			modelCount=split("Model T,Imperial,2CV,Minx Magnificent,Corvette,Fleetwood,Thunderbird,600,Mini,Corvair,Fillmore,Rockette,Mini Cooper,Avanti,Tempest,Grand Prix,Special,Mini Cooper S,Classic,E-Series,Corvair 500,Mustang,Galaxie,GTO,LeMans,Bonneville,Fury,Fairlane,Beetle,Falcon,Interceptor,Toronado,Firebird,Camaro,Bel Air,Country,Cougar,GT500,Charger,GT350,Roadrunner,Torino,914,Vega,SM,Monte Carlo,CX,Monza,Golf,Celica,Volare,Aspen,Caprice,W123,MGB,Horizon,Omni,280ZX,LUV,Riviera,Citation,Civic,Reliant,Aries,W126,6000,Sunbird,Accord,Alliance,626,RX-7,944,1000,Parisienne,Fiero,Firefly,Bronco II,Laser,EXP,Ranger,Escort,Tempo,LTD,F250,F150,E250,LTD Crown Victoria,Bronco,E150,Space,Galant,Mirage,Starion,Pajero,Cordia,Tredia,Brat,S-Class,E-Class,W201,SL-Class,Topaz,Grand Marquis,Lynx,Capri,Marquis,Esprit Turbo,Jetta,Vanagon,Scirocco,Quantum,Electra,Century,Skyhawk,Town Car,Continental,Mark VII,Quattroporte,Biturbo,900,5000S,CR-X,Prelude,Daytona,SJ 410,GLC,Somerset,LeSabre,Regal,Skylark,F-Series,Truck,Chariot,GTI,Cabriolet,Passat,Type 2,4000s,Quattro,Coupe GT,Countach,Familia,B2000,Grand Am,XT,Leone,XR4Ti,Continental Mark VII,Voyager,911,928,Cultus,SJ,MR2,Esprit,Caravan,Taurus,Aerostar,Courier,Mighty Max,Precis,Safari,Gemini,Firebird Trans Am,5000CS Quattro,4000s Quattro,4000CS Quattro,Sable,B-Series,9000,Range Rover,4000,5000CS,929,B2600,Fox,Swift,Justy,924 S,Chevette,Excel,L300,Legend,Integra,924,Turbo Firefly,Tracer,Reatta,Festiva,MX-6,90,80/90,Estate,Probe,MPV,Sigma,Eclipse,Legacy,Sidekick,LS,ES,228,430,Spyder,Karif,80,100,200,Truck Xtracab SR5,6 Series,Colt,Coachbuilder,Loyale,MX-5,Trans Sport,Grand Prix Turbo,V8,Coupe Quattro,Elan,Corrado,Maxima,Datsun/Nissan Z-car,Diablo,Talon,Explorer,Park Avenue,Roadmaster,Navajo,300ZX,Sentra,Sterling,Previa,Eurovan,riolet,Crown Victoria,Club Wagon,Econoline E150,Econoline E250,Econoline E350,F350,Samurai,190E,300CE,300D,300E,300SD,300SE,300SL,300TE,400E,400SE,500E,500SEL,500SL,600SEL,Alcyone SVX,SVX,Diamante,RVR,3000GT,Expo,Mighty Max Macro,Montero,323,Protege,MX-3,B-Series Plus,Miata MX-5,S4,3 Series,5 Series,7 Series,8 Series,M5,Firebird Formula,Defender,SC,Viper,D150 Club,D150,D250 Club,D250,D350 Club,D350,Dakota Club,Dakota,Dynasty,Grand Caravan,Monaco,Ram 50,Ram Van B150,Ram Van B250,Ram Van B350,Ram Wagon B150,Ram Wagon B250,Ram Wagon B350,Ramcharger,Shadow,Spirit,Stealth,968,Seville,Allante,Brougham,DeVille,Eldorado,Camry,4Runner,Corolla,Cressida,Land Cruiser,Paseo,Supra,Tercel,Xtra,240SX,NX,Pathfinder,Stanza,Acclaim,Colt Vista,Grand Voyager,Sundance,Premier,Summit,NSX,Vigor,164,Spider,1500,2500,3500,APV,Astro,Beretta,Blazer,Cavalier,Corsica,G-Series G10,G-Series G20,G-Series G30,Lumina,Lumina APV,S10 Blazer,S10,Sportvan G10,Sportvan G20,Sportvan G30,Suburban 1500,Suburban 2500,Fifth Ave,LeBaron,New Yorker,Town & Country,Charade,Rocky,Metro,Prizm,Storm,Tracker,1500 Club Coupe,2500 Club Coupe,3500 Club Coupe,Jimmy,Rally Wagon 1500,Rally Wagon 2500,Rally Wagon 3500,Sonoma Club,Sonoma,Vandura 1500,Vandura 2500,Vandura 3500,Yukon,Elantra,Scoupe,Sonata,G,M,Q,Amigo,Impulse,Rodeo,Stylus,Trooper,XJ Series,Cherokee,Comanche,Wrangler,88,98,Achieva,Bravada,Ciera,Custom Cruiser,Cutlass Supreme,Silhouette,S-Series,240,740,940,960,Impreza,Villager,C-Class,400SEL,500SEC,600SEC,600SL,Viper RT/10,Intrepid,Golf III,Jetta III,Range Rover Classic,Defender 110,Altima,Quest,Mark VIII,GS,Concorde,del Sol,T100,Grand Cherokee,Sixty Special,Caprice Classic,Vision,Sonoma Club Coupe,H1,J,Cutlass Cruiser,850,Lightning,Aspire,Sephia,Ram,Ram 1500,Ram 2500,Ram 3500,Impala SS,Impala,Discovery,Defender 90,Passport,LHS,Sportage,Sunfire,Windstar,Contour,rio,Mystique,Esteem,Millenia,S6,A6,TL,M3,Avenger,Neon,Ram 1500 Club,Ram 2500 Club,Ram 3500 Club,Ram Van 1500,Ram Van 2500,Ram Van 3500,Stratus,200SX,K5 Blazer,Tahoe,Odyssey,Cirrus,Sebring,VS Commodore,Rally Wagon G2500,Rally Wagon G3500,Vandura G1500,Vandura G2500,Vandura G3500,Accent,Aurora,Avalon,T100 Xtra,Tacoma,Tacoma Xtra,Hearse,A4,Expo LRV,X-90,Breeze,Express 1500,Express 2500,Express 3500,G-Series 1500,G-Series 2500,LX,Z3,RL,SLX,Savana 1500,Savana 2500,Savana 3500,I,Hombre,Oasis,RAV4,Mentor,Mountaineer,CR-V,A8,Challenger,Montero Sport,Boxster,SLK-Class,Expedition,Malibu,G-Series 3500,Venture,Prowler,CL,Catera,Tiburon,QX,Hombre Space,XK Series,Cutlass,LSS,Regency,S90,V90,Forester,New Beetle,Navigator,M-Class,CL-Class,CLK-Class,Durango,Envoy,Frontier,Intrigue,Sienna,C70,S70,V70,Silverado,Silverado 1500,Silverado 2500,Montana,Vitara,Grand Vitara,Discovery Series II,9-3,9-5,RX,EV1,Sierra 1500,Sierra 2500,300M,Sparrow,Escalade,300,Lanos,Leganza,Nubira,VehiCROSS,Alero,Solara,S80,Outback,Insight,S2000,X5,Z8,Spectra,Th!nk,Explorer Sport Trac,Escape,Excursion,Explorer Sport,Focus,TT,Tundra,Ipsum,Echo,Xterra,Sierra 3500,Yukon Denali,Yukon XL 1500,Yukon XL 2500,S-Type,L-Series,S40,V40,Fiesta,ZX2,XL-7,B2500,Tribute,S8,Allroad,Aztek,Lancer,IS,Freelander,525,530,Highlander,Prius,Sequoia,Optima,Silverado 3500,MDX,PT Cruiser,Santa Fe,XG300,Rodeo Sport,S60,Aerio,G-Class,Outback Sport,Pilot,Protege5,Lancer Evolution,Murciélago,Rendezvous,745,Blackwood,Sedona,Envoy XL,Avalanche,Trailblazer,Avalanche 1500,Avalanche 2500,Cooper,RSX,Escalade EXT,XG350,Axiom,X-Type,Liberty,VUE,Marauder,760,Z4,Escort ZX2,Freestar,E350,GX,Element,Civic Si,Civic GX,Cayenne,Outlander,Baja,Vibe,RS6,RS 6,Mazda6,Touareg,Sorento,Gallardo,Aviator,57,62,XC90,XC70,SSR,G35,FX,350Z,Murano,CTS,Escalade ESV,H2,Ascender,Ion,Matrix,Endeavor,Exige,Elise,Carrera GT,Mazda3,RX-8,Amanti,325,545,645,X3,Rainier,Monaro,Monterey,C8 Spyder,C8 Spyder Wide Body,C8 Laviolette,Daewoo Lacetti,Daewoo Magnus,Forenza,Verona,R32,Phaeton,Aveo,Colorado,xA,xB,SRX,XLR,Titan,Pathfinder Armada,TSX,Crossfire,Pacifica,Canyon,Envoy XUV,tC,G6,Daewoo Kalos,Montana SV6,GT,Freestyle,Five Hundred,LaCrosse,Terraza,Reno,SLR McLaren,330,STS,Gran Sport,Coupe,GranSport,300C,Montego,Mariner,Cobalt,Equinox,Uplander,LR3,C8,57S,9-7X,9-2X,Magnum,DB9,Vanquish S,Arnage,Tucson,Armada,Esperante,Phantom,Relay,V50,Sierra Denali,Sierra 3500HD,Sierra 2500HD,Yukon XL,Savana Cargo Van,Sierra Hybrid,Savana,Mazda6 5-Door,Mazda5,Mazda6 Sport,Mazdaspeed6,Azure,Continental GT,Continental Flying Spur,550,650,750,M6,M Roadster,Z4 M,CLS-Class,G55 AMG,SL65 AMG,R-Class,Azera,DTS,XLR-V,CTS-V,STS-V,Commander,Ridgeline,XL7,Lucerne,Rabbit,Spectra5,Torrent,Solstice,Raider,XK,XJ,Yaris,Camry Solara,Tribeca,B9 Tribeca,Suburban,Silverado 3500HD,HHR Panel,Malibu Maxx,HHR,Silverado Hybrid,Express,F-250 Super Duty,F-350 Super Duty,E-350 Super Duty,E-350 Super Duty Van,Fusion,A3,Range Rover Sport,RX Hybrid,Cayman,Milan,H2 SUT,H2 SUV,H3,350Z Roadster,Crossfire Roadster,Zephyr,Mark LT,Sprinter,DB9 Volante,V8 Vantage,Vantage,C8 Double 12 S,F430,612 Scaglietti,F430 Spider,Aero 8,207,i-Series,i-280,i-350,Cobalt SS,Eos,F-Series Super Duty,Edge,Expedition EL,GL-Class,Alpina B7,Nitro,Caliber,Carens,Rondo,Highlander Hybrid,Camry Hybrid,FJ Cruiser,TundraMax,CX-7,Mazdaspeed 3,CX-9,Q7,RS4,RS 4,Compass,Patriot,i-290,i-370,Veracruz,Entourage,Hemisfear,QX56,Fit,Versa,Acadia,Sierra,SX4,599 GTB Fiorano,MKX,MKZ,Navigator L,Outlook,Aura,Sky,G5,Continental GTC,RDX,C30,1 Series,X6,S5,R8,A5,Taurus X,F450,GLI,Touareg 2,LR2,IS-F,IS F,Reventón,Murciélago LP640,Rogue,G37,EX,DBS,Rio5,Astra,G8,430 Scuderia,Clubman,Cooper Clubman,Enclave,Typ-1,GranTurismo,Fortwo,xD,SLK55 AMG,CL65 AMG,Q5,Genesis,H3T,Z4 M Roadster,Traverse,CC,Tiguan,Routan,Mohave/Borrego,Borrego,XC60,Venza,G3,California,Landaulet,Journey,Cube,GT-R,370Z,Flex,Brooklands,Equator,MKS,XF,2e,Veyron,X5 M,X6 M,Accord Crosstour,GLK-Class,Rapide,Genesis Coupe,Panamera,LR4,Soul,Forte,Impreza WRX,MKT,Ghost,Transit Connect,LS Hybrid,HS,458 Italia,Evora,Terrain,Continental Super,Azure T,Kizashi,ZDX,Roadster,Type-1h,Defender Ice Edition,Mazda2,SLS AMG,SLS-Class,Sprinter 2500,Sprinter 3500,CR-Z,CT,Leaf,JUKE,Countryman,Cooper Countryman,Volt,Cruze,V8 Vantage S,V12 Vantage,Virage,Mulsanne,G25,IPL G,9-4X,Equus,Outlander Sport,NV1500,NV2500,NV3500,A7,Range Rover Evoque,FCX Clarity,Crosstour,HED-5,Veloster,Sonic,Prius v,Prius Plug-in Hybrid,Prius c,Prius Plug-in,LFA,500,Nuova 500,FF,Aventador,Model S,Verano,i-MiEV,iQ,MP4-12C,C/V,C-MAX Hybrid,Focus ST,JX,CX-5,FR-S,BRZ", models, ",");
		    model="\x27"models[(int(rand()*modelCount + 1))]"\x27";

			typeCount=split("Compact,Luxury,SUV,Truck,Van", types, ",");
		    type="\x27"types[(int(rand()*typeCount + 1))]"\x27";

			year=int(rand()*60)+1954;

			mileage=int(rand()*150000);
			
			colorCount=split("Alice Blue,Alizarin Crimson,Alloy Orange,Almond,Amaranth,Amber,Amber (Sae/Ece),American Rose,Amethyst,Android Green,Anti-Flash White,Antique Brass,Antique Fuchsia,Antique Ruby,Antique White,Ao (English),Apple Green,Apricot,Aqua,Aquamarine,Army Green,Arsenic,Arylide Yellow,Ash Grey,Asparagus,Atomic Tangerine,Auburn,Aureolin,Aurometalsaurus,Avocado,Azure,Azure Mist/Web,Baby Blue,Baby Blue Eyes,Baby Pink,Ball Blue,Banana Mania,Banana Yellow,Barn Red,Battleship Grey,Bazaar,Beau Blue,Beaver,Beige,Big Dip O’Ruby,Bisque,Bistre,Bittersweet,Bittersweet Shimmer,Black,Black Bean,Black Leather Jacket,Black Olive,Blanched Almond,Blast-Off Bronze,Bleu De France,Blizzard Blue,Blond,Blue,Blue Bell,Blue (Crayola),Blue Gray,Blue-Green,Blue (Munsell),Blue (Ncs),Blue (Pigment),Blue (Ryb),Blue Sapphire,Blue-Violet,Blush,Bole,Bondi Blue,Bone,Boston University Red,Bottle Green,Boysenberry,Brandeis Blue,Brass,Brick Red,Bright Cerulean,Bright Green,Bright Lavender,Bright Maroon,Bright Pink,Bright Turquoise,Bright Ube,Brilliant Lavender,Brilliant Rose,Brink Pink,British Racing Green,Bronze,Brown (Traditional),Brown (Web),Bubble Gum,Bubbles,Buff,Bulgarian Rose,Burgundy,Burlywood,Burnt Orange,Burnt Sienna,Burnt Umber,Byzantine,Byzantium,Cadet,Cadet Blue,Cadet Grey,Cadmium Green,Cadmium Orange,Cadmium Red,Cadmium Yellow,Café Au Lait,Café Noir,Cal Poly Green,Cambridge Blue,Camel,Cameo Pink,Camouflage Green,Canary Yellow,Candy Apple Red,Candy Pink,Capri,Caput Mortuum,Cardinal,Caribbean Green,Carmine,Carmine (M&P),Carmine Pink,Carmine Red,Carnation Pink,Carnelian,Carolina Blue,Carrot Orange,Catalina Blue,Ceil,Celadon,Celadon Blue,Celadon Green,Celeste (Colour),Celestial Blue,Cerise,Cerise Pink,Cerulean,Cerulean Blue,Cerulean Frost,Cg Blue,Cg Red,Chamoisee,Champagne,Charcoal,Charm Pink,Chartreuse (Traditional),Chartreuse (Web),Cherry,Cherry Blossom Pink,Chestnut,China Pink,China Rose,Chinese Red,Chocolate (Traditional),Chocolate (Web),Chrome Yellow,Cinereous,Cinnabar,Cinnamon,Citrine,Classic Rose,Cobalt,Cocoa Brown,Coffee,Columbia Blue,Congo Pink,Cool Black,Cool Grey,Copper,Copper (Crayola),Copper Penny,Copper Red,Copper Rose,Coquelicot,Coral,Coral Pink,Coral Red,Cordovan,Corn,Cornell Red,Cornflower Blue,Cornsilk,Cosmic Latte,Cotton Candy,Cream,Crimson,Crimson Glory,Cyan,Cyan (Process),Daffodil,Dandelion,Dark Blue,Dark Brown,Dark Byzantium,Dark Candy Apple Red,Dark Cerulean,Dark Chestnut,Dark Coral,Dark Cyan,Dark Electric Blue,Dark Goldenrod,Dark Gray,Dark Green,Dark Imperial Blue,Dark Jungle Green,Dark Khaki,Dark Lava,Dark Lavender,Dark Magenta,Dark Midnight Blue,Dark Olive Green,Dark Orange,Dark Orchid,Dark Pastel Blue,Dark Pastel Green,Dark Pastel Purple,Dark Pastel Red,Dark Pink,Dark Powder Blue,Dark Raspberry,Dark Red,Dark Salmon,Dark Scarlet,Dark Sea Green,Dark Sienna,Dark Slate Blue,Dark Slate Gray,Dark Spring Green,Dark Tan,Dark Tangerine,Dark Taupe,Dark Terra Cotta,Dark Turquoise,Dark Violet,Dark Yellow,Dartmouth Green,Davy Grey,Debian Red,Deep Carmine,Deep Carmine Pink,Deep Carrot Orange,Deep Cerise,Deep Champagne,Deep Chestnut,Deep Coffee,Deep Fuchsia,Deep Jungle Green,Deep Lilac,Deep Magenta,Deep Peach,Deep Pink,Deep Ruby,Deep Saffron,Deep Sky Blue,Deep Tuscan Red,Denim,Desert,Desert Sand,Dim Gray,Dodger Blue,Dogwood Rose,Dollar Bill,Drab,Duke Blue,Earth Yellow,Ebony,Ecru,Eggplant,Eggshell,Egyptian Blue,Electric Blue,Electric Crimson,Electric Cyan,Electric Green,Electric Indigo,Electric Lavender,Electric Lime,Electric Purple,Electric Ultramarine,Electric Violet,Electric Yellow,Emerald,English Lavender,Eton Blue,Fallow,Falu Red,Fandango,Fashion Fuchsia,Fawn,Feldgrau,Fern Green,Ferrari Red,Field Drab,Fire Engine Red,Firebrick,Flame,Flamingo Pink,Flavescent,Flax,Floral White,Fluorescent Orange,Fluorescent Pink,Fluorescent Yellow,Folly,Forest Green (Traditional),Forest Green (Web),French Beige,French Blue,French Lilac,French Lime,French Raspberry,French Rose,Fuchsia,Fuchsia (Crayola),Fuchsia Pink,Fuchsia Rose,Fulvous,Fuzzy Wuzzy,Gainsboro,Gamboge,Ghost White,Ginger,Glaucous,Glitter,Gold (Metallic),Gold (Web) (Golden),Golden Brown,Golden Poppy,Golden Yellow,Goldenrod,Granny Smith Apple,Gray,Gray-Asparagus,Gray (Html/Css Gray),Gray (X11 Gray),Green (Color Wheel) (X11 Green),Green (Crayola),Green (Html/Css Green),Green (Munsell),Green (Ncs),Green (Pigment),Green (Ryb),Green-Yellow,Grullo,Guppie Green,Halayà úBe,Han Blue,Han Purple,Hansa Yellow,Harlequin,Harvard Crimson,Harvest Gold,Heart Gold,Heliotrope,Hollywood Cerise,Honeydew,Honolulu Blue,Hooker Green,Hot Magenta,Hot Pink,Hunter Green,Iceberg,Icterine,Imperial Blue,Inchworm,India Green,Indian Red,Indian Yellow,Indigo,Indigo (Dye),Indigo (Web),International Klein Blue,International Orange (Aerospace),International Orange (Engineering),International Orange (Golden Gate Bridge),Iris,Isabelline,Islamic Green,Ivory,Jade,Jasmine,Jasper,Jazzberry Jam,Jet,Jonquil,June Bud,Jungle Green,Kelly Green,Kenyan Copper,Khaki (Html/Css) (Khaki),Khaki (X11) (Light Khaki),Ku Crimson,La Salle Green,Languid Lavender,Lapis Lazuli,Laser Lemon,Laurel Green,Lava,Lavender Blue,Lavender Blush,Lavender (Floral),Lavender Gray,Lavender Indigo,Lavender Magenta,Lavender Mist,Lavender Pink,Lavender Purple,Lavender Rose,Lavender (Web),Lawn Green,Lemon,Lemon Chiffon,Lemon Lime,Licorice,Light Apricot,Light Blue,Light Brown,Light Carmine Pink,Light Coral,Light Cornflower Blue,Light Crimson,Light Cyan,Light Fuchsia Pink,Light Goldenrod Yellow,Light Gray,Light Green,Light Khaki,Light Pastel Purple,Light Pink,Light Red Ochre,Light Salmon,Light Salmon Pink,Light Sea Green,Light Sky Blue,Light Slate Gray,Light Taupe,Light Thulian Pink,Light Yellow,Lilac,Lime (Color Wheel),Lime Green,Lime (Web) (X11 Green),Limerick,Lincoln Green,Linen,Lion,Little Boy Blue,Liver,Lust,Magenta,Magenta (Dye),Magenta (Process),Magic Mint,Magnolia,Mahogany,Maize,Majorelle Blue,Malachite,Manatee,Mango Tango,Mantis,Mardi Gras,Maroon (Crayola),Maroon (Html/Css),Maroon (X11),Mauve,Mauve Taupe,Mauvelous,Maya Blue,Meat Brown,Medium Aquamarine,Medium Blue,Medium Candy Apple Red,Medium Carmine,Medium Champagne,Medium Electric Blue,Medium Jungle Green,Medium Lavender Magenta,Medium Orchid,Medium Persian Blue,Medium Purple,Medium Red-Violet,Medium Ruby,Medium Sea Green,Medium Slate Blue,Medium Spring Bud,Medium Spring Green,Medium Taupe,Medium Turquoise,Medium Tuscan Red,Medium Vermilion,Medium Violet-Red,Mellow Apricot,Mellow Yellow,Melon,Midnight Blue,Midnight Green (Eagle Green),Mikado Yellow,Mint,Mint Cream,Mint Green,Misty Rose,Moccasin,Mode Beige,Moonstone Blue,Mordant Red 19,Moss Green,Mountain Meadow,Mountbatten Pink,Msu Green,Mulberry,Mustard,Myrtle,Nadeshiko Pink,Napier Green,Naples Yellow,Navajo White,Navy Blue,Neon Carrot,Neon Fuchsia,Neon Green,New York Pink,Non-Photo Blue,North Texas Green,Ocean Boat Blue,Ochre,Office Green,Old Gold,Old Lace,Old Lavender,Old Mauve,Old Rose,Olive,Olive Drab #7,Olive Drab (Web) (Olive Drab #3),Olivine,Onyx,Opera Mauve,Orange (Color Wheel),Orange Peel,Orange-Red,Orange (Ryb),Orange (Web Color),Orchid,Otter Brown,Ou Crimson Red,Outer Space,Outrageous Orange,Oxford Blue,Pakistan Green,Palatinate Blue,Palatinate Purple,Pale Aqua,Pale Blue,Pale Brown,Pale Carmine,Pale Cerulean,Pale Chestnut,Pale Copper,Pale Cornflower Blue,Pale Gold,Pale Goldenrod,Pale Green,Pale Lavender,Pale Magenta,Pale Pink,Pale Plum,Pale Red-Violet,Pale Robin Egg Blue,Pale Silver,Pale Spring Bud,Pale Taupe,Pale Violet-Red,Pansy Purple,Papaya Whip,Paris Green,Pastel Blue,Pastel Brown,Pastel Gray,Pastel Green,Pastel Magenta,Pastel Orange,Pastel Pink,Pastel Purple,Pastel Red,Pastel Violet,Pastel Yellow,Patriarch,Payne Grey,Peach,Peach (Crayola),Peach-Orange,Peach Puff,Peach-Yellow,Pear,Pearl,Pearl Aqua,Pearly Purple,Peridot,Periwinkle,Persian Blue,Persian Green,Persian Indigo,Persian Orange,Persian Pink,Persian Plum,Persian Red,Persian Rose,Persimmon,Peru,Phlox,Phthalo Blue,Phthalo Green,Piggy Pink,Pine Green,Pink,Pink Lace,Pink-Orange,Pink Pearl,Pink Sherbet,Pistachio,Platinum,Plum (Traditional),Plum (Web),Portland Orange,Powder Blue (Web),Princeton Orange,Prune,Prussian Blue,Psychedelic Purple,Puce,Pumpkin,Purple Heart,Purple (Html/Css),Purple Mountain Majesty,Purple (Munsell),Purple Pizzazz,Purple Taupe,Purple (X11),Quartz,Rackley,Radical Red,Rajah,Raspberry,Raspberry Glace,Raspberry Pink,Raspberry Rose,Raw Umber,Razzle Dazzle Rose,Razzmatazz,Red,Red-Brown,Red Devil,Red (Munsell),Red (Ncs),Red-Orange,Red (Pigment),Red (Ryb),Red-Violet,Redwood,Regalia,Resolution Blue,Rich Black,Rich Brilliant Lavender,Rich Carmine,Rich Electric Blue,Rich Lavender,Rich Lilac,Rich Maroon,Rifle Green,Robin Egg Blue,Rose,Rose Bonbon,Rose Ebony,Rose Gold,Rose Madder,Rose Pink,Rose Quartz,Rose Taupe,Rose Vale,Rosewood,Rosso Corsa,Rosy Brown,Royal Azure,Royal Blue (Traditional),Royal Blue (Web),Royal Fuchsia,Royal Purple,Royal Yellow,Rubine Red,Ruby,Ruby Red,Ruddy,Ruddy Brown,Ruddy Pink,Rufous,Russet,Rust,Rusty Red,Sacramento State Green,Saddle Brown,Safety Orange (Blaze Orange),Saffron,Salmon,Salmon Pink,Sand,Sand Dune,Sandstorm,Sandy Brown,Sandy Taupe,Sangria,Sap Green,Sapphire,Sapphire Blue,Satin Sheen Gold,Scarlet,Scarlet (Crayola),School Bus Yellow,Screamin Green,Sea Blue,Sea Green,Seal Brown,Seashell,Selective Yellow,Sepia,Shadow,Shamrock Green,Shocking Pink,Shocking Pink (Crayola),Sienna,Silver,Sinopia,Skobeloff,Sky Blue,Sky Magenta,Slate Blue,Slate Gray,Smalt (Dark Powder Blue),Smokey Topaz,Smoky Black,Snow,Spiro Disco Ball,Spring Bud,Spring Green,St. Patrick Blue,Steel Blue,Stil De Grain Yellow,Stizza,Stormcloud,Straw,Sunglow,Sunset,Tan,Tangelo,Tangerine,Tangerine Yellow,Tango Pink,Taupe,Taupe Gray,Tea Green,Tea Rose (Orange),Tea Rose (Rose),Teal,Teal Blue", colors, ",");
		    color="\x27"colors[(int(rand()*colorCount + 1))]"\x27";

			print("INSERT INTO VEHICLE VALUE("vin", "make", "model", "type", "year", "mileage", "color");\\n");

			yearacc=int(rand()*10)+2003;
			if (rand() <= 0.5) {
				CUSTOMER_VINS[vidx++] = vin;
				YEARSACC[yidx++] = yearacc;
			} else {
				dealerid=int(rand() * 10) + 1001;
				dataacc="\x27"yearacc""sprintf("%02d", (int(rand()*12)))""sprintf("%02d", (int(rand()*28)))"\x27";
				cost = int(rand() * 20000) + 2500;
				price = cost + (rand()*cost);
				print("INSERT INTO VEHICLE_INVENTORY VALUE("vin", "dealerid", "dataacc", "cost", "price");\\n");
			}
		 }
       }
		{
			if (aidx == 6) {
				aidx = 1;
			}
			if (aidx==1) {
				split($0,name," ");
				NAME[nidx++]="\x27"name[1]"\x27";
				NAME[nidx++]="\x27"name[2]"\x27";
			} else if (aidx==4){
				NAME[nidx++]=$0;
			}
				aidx++;
			}
	END {
			entries = nidx-1;
			vin = 1;
			for (i = 1; i <= entries && vin < vidx; i=i+3) {
				letterCount=split("Q W E R T Y U I O P A S D F G H J K L Z X C V B N M", letters, " ");
		    	minit="\x27"letters[(int(rand()*letterCount + 1))]"\x27";
				addressid=int(rand()*500 + 1);
				split(NAME[i+2], phone, " ");
            			gsub(/[()]/, "", phone[1]);
            			ePhone="\x27"phone[1]""(int(rand()*999))""(int(rand()*9999))"\x27";
				print("INSERT INTO CUSTOMER VALUE(NULL, "NAME[i]", "minit", "NAME[i+1]", "addressid", "ePhone", "CUSTOMER_VINS[vin]");\\n");

				saleprice = int(rand() * 35000) + 10000;
				yearsold = YEARSACC[vin] + int(rand() * 2);
				datesold="\x27"yearsold""sprintf("%02d", (int(rand()*12)))""sprintf("%02d", (int(rand()*28)))"\x27";
				empid=int(rand() * 250) + 1;
				print("INSERT INTO SALE VALUE(NULL, "CUSTOMER_VINS[vin]", "saleprice", "datesold", "empid", "vin");\\n");
				vin++;
			}
			
			serviceCount=split("1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1022,1023,1024,1025,1026,1027,1028,1029,1030,1031,1032,1033,1034,1035,1036,1037,1039,1040,1041", services, ",");			
			split("10.00,1000.00,150.00,100.00,500.00,20.00,100.00,150.00,4000.00,100.00,100.00,100.00,4000.00,20.00,200.00,500.00,50.00,800.00,300.00,300.00,5000.00,600.00,500.00,1000.00,50.00,300.00,100.00,100.00,300.00,200.00,200.00,100.00,300.00,50.00,50.00,600.00,800.00,50.00,500.00,100.00", costs, ",");
			
			servicetrips=vidx-1;
			for (s = 0; s < servicetrips; s++) {
				sidx = int(rand() * serviceCount) + 1;
				serviceid = services[sidx];
				customerid=int(rand() * (vidx - 1)) + 1;
				v=int(rand() * (vidx - 1)) + 1;
				vin=CUSTOMER_VINS[v]
				scheduleddate="\x27"int(rand()*3+YEARSACC[v]+1)""sprintf("%02d", (int(rand()*12)))""sprintf("%02d", (int(rand()*28)))"\x27";
				amountpaid=sprintf("%6.2f",rand() * costs[sidx]);
				balance=sprintf("%6.2f",costs[sidx] - amount_paid);
				dealerid=int(rand() * 10) + 1001;
				print("INSERT INTO SERVICE_RECORD VALUE("int(rand() *99999999)", "serviceid", "customerid", "vin", "scheduleddate", "balance", "amountpaid", NULL, "dealerid");\\n");
			}
		}')
	echo -e "USE FAST3_DEALERSHIP;\n"
	echo -e $DATA
}


function printPartInventory {
	DATA=$(awk '
	    BEGIN{
			srand();
			partCount=split("1219200,1219205,1219212,1219219,2012345,2012350,2012375,2012377,2012388,2012567,2056775,2056776,2056880,2056881,2057000,2057001,2057200,2057201,2057210,2057211,2057220,2057221,2102303,2102304,2102305,2102306,2102307,2102308,2102309,2102310,2102311,2102312,2102313,2102314,2200001,3111033,3113145,3113199,3113292,3113300,3113301,3113305,3113324,3113344,3113884,3114111,3114375,3114519,3115093,3116034,3117420,3222200,3300101,3300102,3300103,3300104,3300105,3300999,3330001,3330100,3999001,3999099,4000108,4000209,4000210,4500001,7000000,8000120,8000121,8000122,8000123,8000125,8000127,8000999,8002000,9999001", parts, ",");			
			split("100.00,15.00,5.00,50.00,300.00,500.00,70.00,70.00,250.00,50.00,400.00,300.00,400.00,300.00,20.00,20.00,10.00,10.00,10.00,10.00,10.00,10.00,20.00,20.00,20.00,20.00,20.00,20.00,20.00,22.00,22.00,22.00,22.00,22.00,5.00,10000.00,1100.00,870.00,500.00,550.00,25.00,90.00,1000.00,50.00,50.00,1500.00,1500.00,20.00,20.00,50.00,400.00,500.00,2.00,2.00,2.00,2.00,2.00,10.00,20.00,20.00,3500.00,30.00,50.00,100.00,200.00,30.00,50.00,95.00,95.00,100.00,100.00,105.00,105.00,2.00,10.00,1.00", costs, ",");
			split("New Used", states, " ");
			for (i = 1; i < partCount; i++) {
				for (dealerid = 1001; dealerid <= 1010; dealerid++) {
					yearmanu=int(rand()*15)+2000;
					state="\x27"states[int(rand() * 2) + 1]"\x27";
					cost=costs[i];
					price=sprintf("%6.2f",(rand()*15 + cost));
					quantity=int(rand() * 100);
					print("INSERT INTO PART_INVENTORY VALUE("parts[i]", "dealerid", "yearmanu", "state", "price", "quantity");\\n");
				}
			}			
		}')

	echo -e "USE FAST3_DEALERSHIP;\n"
  	echo -e $DATA
}


if [ $# -lt 1 ]; then
	echo -e "USE FAST3_DEALERSHIP;\n" > generated_data.sql

    for i in $(seq 1000); do 
		printAddress | grep "WA" >> generated_data.sql
	done

	#add in data generated by hand -- Thanks again Joon :)
	#cat ./sample_data.sql >> generated_data.sql

	#printEmployee employee 250 >> generated_data.sql

	#printPartInventory >> generated_data.sql

	#printVehicleCustomer 1000 >> generated_data.sql

elif [ $1 == 'e' ]; then
	if [ $# -eq 2 ]; then
    	printEmployee $2
	else
		printEmployee 1
	fi
elif [ $1 == 'a' ]; then
    printAddress
elif [ $1 == 'vc' ]; then
	if [ $# -eq 2 ]; then
    	printVehicleCustomer $2
	else
		printVehicleCustomer 1
	fi
elif [ $1 == 'p' ]; then
	if [ $# -eq 2 ]; then
    	printParts $2
	else
		printParts 1
	fi
elif [ $1 == 'i' ]; then
    printPartInventory
else
	help
fi
