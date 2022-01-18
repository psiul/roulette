select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,household_demographics hd,customer_demographics cd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and d.d_hash >= 446 and d.d_hash <= 546 and i.i_hash >= 462 and i.i_hash <= 482 and hd.hd_hash >= 831 and hd.hd_hash <= 881
;
