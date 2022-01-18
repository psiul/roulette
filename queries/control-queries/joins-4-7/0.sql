select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,household_demographics hd,item i
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 507 and ss.ss_hash <= 907 and hd.hd_hash >= 133 and hd.hd_hash <= 883 and i.i_hash >= 230 and i.i_hash <= 563
;
