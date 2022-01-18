select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer_demographics cd,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 444 and ss.ss_hash <= 844 and i.i_hash >= 195 and i.i_hash <= 528 and cd.cd_hash >= 42 and cd.cd_hash <= 792
;
