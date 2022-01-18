select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,store_returns sr,item i,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 456 and ss.ss_hash <= 789 and i.i_hash >= 117 and i.i_hash <= 867 and hd.hd_hash >= 228 and hd.hd_hash <= 628
;
