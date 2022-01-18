select count(ss.ss_item_sk)
from store_sales ss,customer c,item i,household_demographics hd,store_returns sr
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 569 and ss.ss_hash <= 902 and c.c_hash >= 326 and c.c_hash <= 726 and hd.hd_hash >= 216 and hd.hd_hash <= 966
;
