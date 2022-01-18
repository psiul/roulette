select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer_demographics cd,item i,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 243 and ss.ss_hash <= 993 and i.i_hash >= 58 and i.i_hash <= 458 and hd.hd_hash >= 523 and hd.hd_hash <= 856
;
