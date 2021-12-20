import net.http
import os

 struct Input{
	   pub mut:
	       id string
		   token string
		   giftid string
}

fn profile(){
   	ids := Input { id: os.args[1] }
	tokens := Input { token: os.args[2] }
	mut req := http.new_request(.post, 'https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/profile/fa5c38e4ee444411a69ec2059bf82909/client/QueryProfile?profileId=athena&rvn=-1', '') or { return }
    req.add_custom_header("Content-Type", 'application/json') or { return }
	req.add_custom_header("Authorization", 'Bearer 98f85dcbe7f64b03b209efd159ece2eb') or { return }
}

fn claim_peely(){
   	ids := Input { id: os.args[1] }
	tokens := Input { token: os.args[2] }
	mut req := http.new_request(.post, 'https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/profile/fa5c38e4ee444411a69ec2059bf82909/client/UnlockRewardNode?profileId=athena&rvn=-1', 'nodeId: "ERG.Node.D.1", rewardGraphId: "AthenaRewardGraph:s19_winterfest", rewardCfg: ""') or { return }
    req.add_custom_header("Content-Type", 'application/json') or { return }
	req.add_custom_header("Authorization", 'Bearer 98f85dcbe7f64b03b209efd159ece2eb') or { return }
}

fn authenticate(){
    ids := Input { id: os.args[1] }
	tokens := Input { token: os.args[2] }
	mut req := http.new_request(.post, 'https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/profile/fa5c38e4ee444411a69ec2059bf82909/client/UnlockRewardNode?profileId=athena&rvn=-1', 'grant_type=authorization_code&code=98f85dcbe7f64b03b209efd159ece2eb') or { return }
    req.add_custom_header("Content-Type", 'application/x-www-form-urlencoded') or { return }
	req.add_custom_header("Authorization", 'Basic MzQ0NmNkNzI2OTRjNGE0NDg1ZDgxYjc3YWRiYjIxNDE6OTIwOWQ0YTVlMjVhNDU3ZmI5YjA3NDg5ZDMxM2I0MWE=') or { return }
}

fn main(){
   authenticate()
   profile()
   claim_peely()
   println("Peely successfully claimed!!!!")
}