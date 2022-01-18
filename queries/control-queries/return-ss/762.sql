select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and hd.hd_hash >= 71 and hd.hd_hash <= 471 and cd.cd_hash >= 124 and cd.cd_hash <= 874 and i.i_hash >= 287 and i.i_hash <= 620
;
