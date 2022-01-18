select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,date_dim d,item i,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 567 and ss.ss_hash <= 900 and hd.hd_hash >= 34 and hd.hd_hash <= 784 and i.i_hash >= 431 and i.i_hash <= 831
;
