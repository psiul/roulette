select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer_demographics cd,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 65 and ss.ss_hash <= 465 and hd.hd_hash >= 168 and hd.hd_hash <= 918 and i.i_hash >= 381 and i.i_hash <= 714
;
