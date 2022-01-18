select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,customer_demographics cd,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_cdemo_sk = cd.cd_demo_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 147 and ss.ss_hash <= 480 and i.i_hash >= 150 and i.i_hash <= 900 and hd.hd_hash >= 145 and hd.hd_hash <= 545
;
