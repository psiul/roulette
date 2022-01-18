select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 131 and ss.ss_hash <= 881 and d.d_hash >= 255 and d.d_hash <= 655 and hd.hd_hash >= 151 and hd.hd_hash <= 484
;
