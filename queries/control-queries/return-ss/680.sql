select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 543 and ss.ss_hash <= 943 and c.c_hash >= 40 and c.c_hash <= 790 and hd.hd_hash >= 364 and hd.hd_hash <= 697
;
