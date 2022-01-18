select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and cd.cd_hash >= 173 and cd.cd_hash <= 923 and hd.hd_hash >= 508 and hd.hd_hash <= 908 and i.i_hash >= 352 and i.i_hash <= 685
;
