select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 218 and ss.ss_hash <= 551 and cd.cd_hash >= 174 and cd.cd_hash <= 574 and hd.hd_hash >= 79 and hd.hd_hash <= 829
;
