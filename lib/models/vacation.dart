enum Vocation {
  //Raider, junkie, dll merupakan suatu nilai/kategori dalam enum Vocation
  raider(
    title: "Terminal rider",
    description: "Adept in terminal commands to trigger traps.",
    weapon: 'Terminal',
    ability: 'Shellshock',
    image: 'terminal_raider.jpg',
  ),
  junkie(
    title: "Code Junkie",
    description: "Uses code to infiltrate enemy defenses.",
    weapon: 'React 99',
    ability: 'Higher oOrder Overdrive',
    image: 'code_junkie.jpg',
  ),
  ninja(
    title: "UX Ninja",
    description: "Uses quick & stealthy visual attack",
    weapon: 'Indused Stylus',
    ability: 'Triple Swipe',
    image: 'ux_ninja.jpg',
  ),
  wizard(
    title: "Algo Wizard",
    description: "Uses algorithmic techniques to bypass enemy defenses.",
    weapon: 'Critical Staff',
    ability: 'Algorythmic Daze',
    image: 'algo_wizard.jpg',
  );

//Constructor
  const Vocation({
    required this.title,
    required this.description,
    required this.image,
    required this.weapon,
    required this.ability,
  });

  final String title;
  final String description;
  final String image;
  final String weapon;
  final String ability;
}
