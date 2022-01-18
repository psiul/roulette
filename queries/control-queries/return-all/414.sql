select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,household_demographics hd,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_hash >= 144 and ss.ss_hash <= 544 and hd.hd_hash >= 145 and hd.hd_hash <= 895 and c.c_hash >= 325 and c.c_hash <= 658
;
