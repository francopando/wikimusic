BEGIN;

-- Reverts 20260906003200_provinces_to_spanish.sql.
--
-- Puts the two English sentinels back exactly where they were: "Born Abroad" on
-- the eighteen rows that carried it, and "No Province" on the sixty-seven that
-- did -- including the two rows the forward migration sent to "Nacido en el
-- Exterior" rather than to NULL.

UPDATE artists
   SET province = 'Born Abroad',
       updated_at = now()
 WHERE slug IN (
    'altamira-banda-show', 'black-45-king', 'calacote', 'carmen-jimenez',
    'daniel-santacruz', 'dj-mari-d', 'dominic', 'felix-cumbe',
    'marielle-hazlo', 'mark-b', 'mike-el-beta', 'pierre-carbuccia',
    'prince-royce', 'proyecto-uno', 'silvio-mora', 't-y-s',
    'urbanda', 'victor-roque-y-la-gran-manzana');

UPDATE artists
   SET province = 'No Province',
       updated_at = now()
 WHERE slug IN (
    'adriel-sfx', 'albert-mendez', 'alejandro-torrens', 'amarfis-y-la-banda-de-atakke',
    'andre-parra-marte', 'andres-rodriguez', 'anon-muller', 'anthony',
    'antihippie', 'antonio-vasquez', 'apofis-imn', 'archaios',
    'arrozito', 'bachata-gang', 'blackee-impala', 'blackfox',
    'bryan-dotel', 'charlie-rodriguez', 'chris-disla', 'crisisromani',
    'dj-joe-catador', 'dj-plano', 'grupo-extra', 'kalimete',
    'karlos-rose', 'kewdy-de-los-santos', 'kiko-rodriguez', 'kilvin-pena',
    'king-streetz', 'korven-brox', 'la-armada', 'la-baby',
    'la-pajarita-la-paul', 'lapiitoh-dangers', 'lenny-santana', 'lolo-en-el-microfono',
    'los-ahijados', 'los-homeboys', 'los-sufridos', 'lucien-le-grub',
    'luis-pimentel-y-su-conjunto-de-estrellas', 'luny', 'luny-tunes', 'magdalena-delgado',
    'mamajuana', 'manikkomio', 'manole-y-la-banda-del-truco', 'manolin-gonzalez',
    'manuel-jimenez', 'manuel-troncoso', 'manyee-audio', 'marcos-andres-peguero-familia',
    'mariangel', 'martin-valoy', 'mc-wayne', 'medusa',
    'melida-rodriguez', 'memin', 'migz', 'milka-la-mas-dura',
    'milly-jocelyn-y-los-vecinos', 'miriam-y-las-chicas', 'monsanto', 'moria',
    'mr-yeison', 'musiquito', 'sammy-the-greatest');

COMMIT;
