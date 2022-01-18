select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,store_returns sr,customer_demographics cd,item i
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 532 and ss.ss_hash <= 932 and hd.hd_hash >= 154 and hd.hd_hash <= 904 and i.i_hash >= 492 and i.i_hash <= 825
;
