select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,customer_demographics cd,store_returns sr,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 235 and ss.ss_hash <= 635 and hd.hd_hash >= 34 and hd.hd_hash <= 367 and cd.cd_hash >= 226 and cd.cd_hash <= 976
;
