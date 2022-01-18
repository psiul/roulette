select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 448 and ss.ss_hash <= 648 and i.i_hash >= 338 and i.i_hash <= 838
;
