select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 519 and ss.ss_hash <= 852 and i.i_hash >= 2 and i.i_hash <= 752 and cd.cd_hash >= 235 and cd.cd_hash <= 635
;
