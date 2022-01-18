select count(ss.ss_item_sk)
from store_sales ss,item i,household_demographics hd,store_returns sr,customer_demographics cd
where ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and i.i_hash >= 365 and i.i_hash <= 765 and hd.hd_hash >= 525 and hd.hd_hash <= 858 and cd.cd_hash >= 140 and cd.cd_hash <= 890
;
