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
	mut re := http.new_request(.post, 'https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/profile/${ids.id}/client/QueryProfile?profileId=athena&rvn=-1', '') or { return }
    re.add_custom_header("Content-Type", 'application/json') or { return }
	re.add_custom_header("Authorization", 'Bearer ${tokens.token}') or { return }
	reg := re.do() or { return }
}

fn claim_peely(){
   	ids := Input { id: os.args[1] }
	tokens := Input { token: os.args[2] }
	mut reqs := http.new_request(.post, 'https://fortnite-public-service-prod11.ol.epicgames.com/fortnite/api/game/v2/profile/${ids.id}/client/UnlockRewardNode?profileId=athena&rvn=-1', 'nodeId: "ERG.Node.D.1" rewardGraphId: "AthenaRewardGraph:s19_winterfest" rewardCfg: ""') or { return }
    reqs.add_custom_header("Content-Type", 'application/json') or { return }
	reqs.add_custom_header("Authorization", 'Bearer ${tokens.token}') or { return }
    ress := reqs.do() or { return }
}

fn authenticate(){
    ids := Input { id: os.args[1] }
	tokens := Input { token: os.args[2] }
	mut req := http.new_request(.post, 'https://account-public-service-prod.ol.epicgames.com/account/api/oauth/token', 'grant_type=authorization_code&code=${tokens.token}') or { return }
    req.add_custom_header("Content-Type", 'application/x-www-form-urlencoded') or { return }
	req.add_custom_header("Authorization", 'Basic MzQ0NmNkNzI2OTRjNGE0NDg1ZDgxYjc3YWRiYjIxNDE6OTIwOWQ0YTVlMjVhNDU3ZmI5YjA3NDg5ZDMxM2I0MWE=') or { return }
	res := req.do() or { return }
}

fn main(){
   authenticate()
   profile()
   claim_peely()
   println("Peely claimed !!!!")
}

//https://account-public-service-prod.ol.epicgames.com/account/api/oauth/token  grant_type=authorization_code&code=${tokens.token}