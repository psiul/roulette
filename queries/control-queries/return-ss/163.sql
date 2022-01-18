select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,household_demographics hd,store_returns sr
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_hash >= 144 and ss.ss_hash <= 894 and i.i_hash >= 523 and i.i_hash <= 923 and d.d_hash >= 402 and d.d_hash <= 735
;
