const admin = require("firebase-admin");
const serviceAccount = require("./serviceAccountKey.json");
const gamesData = require("./game_data.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

const db = admin.firestore();
const namaCollection = "games";

async function mulaiImport() {
  console.log("Starting the data import process...");

  for (const game of gamesData) {
    try {
      const res = await db.collection(namaCollection).add(game);
    } catch (err) {
      console.error("❌ Failed to push data: ", err);
    }
  }

  console.log("\n All done! All JSON data has been moved to Cloud Firestore.");
  process.exit();
}

mulaiImport();