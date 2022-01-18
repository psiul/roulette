select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,store_returns sr,customer c
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 505 and ss.ss_hash <= 838 and hd.hd_hash >= 182 and hd.hd_hash <= 932 and c.c_hash >= 61 and c.c_hash <= 461
;
