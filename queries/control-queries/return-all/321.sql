select count(ss.ss_item_sk)
from store_sales ss,item i,customer_demographics cd,store_returns sr,household_demographics hd
where ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_hash >= 453 and ss.ss_hash <= 853 and i.i_hash >= 85 and i.i_hash <= 835 and hd.hd_hash >= 244 and hd.hd_hash <= 577
;
