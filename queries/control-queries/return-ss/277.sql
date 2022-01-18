select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,customer_demographics cd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 21 and i.i_hash <= 771 and hd.hd_hash >= 53 and hd.hd_hash <= 453 and cd.cd_hash >= 35 and cd.cd_hash <= 368
;
