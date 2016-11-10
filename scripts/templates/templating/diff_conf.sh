#/bin/bash
echo "compare production.properties..."
diff web1/production.properties web2/production.properties
echo "compare integration.properties..."
diff web1/integration.properties web2/integration.properties
echo "compare edocker.template..."
diff web1/edocker.template web2/edocker.template
echo "compare edocker.properties..."
diff web1/edocker.properties web2/edocker.properties
