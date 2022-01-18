select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 239 and ss.ss_hash <= 639 and i.i_hash >= 153 and i.i_hash <= 486 and hd.hd_hash >= 100 and hd.hd_hash <= 850
;
