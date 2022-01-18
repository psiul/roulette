select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and i.i_hash >= 159 and i.i_hash <= 559 and cd.cd_hash >= 97 and cd.cd_hash <= 847 and hd.hd_hash >= 357 and hd.hd_hash <= 690
;
